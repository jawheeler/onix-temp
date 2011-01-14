# coding: utf-8

require 'tempfile'
require 'fileutils'

module ONIX

  # A standalone class that can be used to normalise ONIX files
  # into a standardised form. If you're accepting ONIX files from a wide range
  # of suppliers, you're guarunteed to get all sorts of dialects.
  #
  # This will create a new file that:
  #
  # - is UTF-8 encoded
  # - uses reference tags, not short
  # - has no named entities (ndash, etc) other than &amp; &lt; and &gt;
  #
  # Usage:
  #
  #   ONIX::Normaliser.process("oldfile.xml", "newfile.xml")
  #   
  # Dependencies:
  #
  # At this stage the class depends on several external apps, all commonly available
  # on *nix systems: xsltproc, isutf8, iconv and sed
  #
  class Normaliser

    class << self

      # normalise oldfile and save it as newfile. oldfile
      # will be left untouched
      #
      def process(oldfile, newfile)
        self.new(oldfile, newfile).run
      end
    end

    def initialize(oldfile, newfile)
      raise ArgumentError, "#{oldfile} does not exist" unless File.file?(oldfile)
      raise ArgumentError, "#{newfile} already exists" if File.file?(newfile)
      raise "xsltproc app not found" unless app_available?("xsltproc")
      raise "isutf8 app not found"   unless app_available?("isutf8")
      raise "iconv app not found"    unless app_available?("iconv")
      raise "sed app not found"      unless app_available?("sed")
      raise "tr app not found"       unless app_available?("tr")

      @oldfile = oldfile
      @newfile = newfile
      @curfile = next_tempfile
      FileUtils.cp(@oldfile, @curfile)
      @head    = File.open(@oldfile, "r") { |f| f.read(1024) }
    end

    def run
      # remove short tags
      if @head.include?("ONIXmessage")
        dest = next_tempfile
        to_reference_tags(@curfile, dest)
        @curfile = dest
      end

      # convert to utf8
      dest = next_tempfile
      to_utf8(@curfile, dest)
      @curfile = dest

      # remove control chars
      dest = next_tempfile
      remove_control_chars(@curfile, dest)
      @curfile = dest

      # remove entities
      replace_named_entities(@curfile)

      FileUtils.cp(@curfile, @newfile)
    end

    private

    # check the specified app is available on the system
    #
    def app_available?(app)
      `which #{app}`.strip == "" ? false : true
    end

    # generate a temp filename
    #
    def next_tempfile
      p = nil
      Tempfile.open("onix") do |tf|
        tf.close
        p = tf.path
      end
      p
    end

    # uses an XSLT stylesheet provided by edituer to convert
    # a file from short tags to long tags.
    #
    # more detail here:
    #   http://www.editeur.org/files/ONIX%203/ONIX%20tagname%20converter%20v2.htm
    #
    def to_reference_tags(src, dest)
      inpath = File.expand_path(src)
      outpath = File.expand_path(dest)
      xsltpath = File.dirname(__FILE__) + "/../../support/switch-onix-2.1-short-to-reference.xsl"
      `xsltproc -o #{outpath} #{xsltpath} #{inpath}`
    end

    # ensure the file is valid utf8, then make sure it's declared as such.
    #
    # The following behaviour is  expected:
    #
    #   file is valid utf8, is marked correctly
    #     - copied untouched
    #   file is valid utf8, is marked incorrectly or has no marked encoding
    #     - copied and encoding mark fixed or added
    #   file is no utf8, encoding is marked
    #     - file is converted to utf8 and enecoding mark is updated
    #   file is not utf8, encoding is not marked
    #     - file is copied untouched
    #
    def to_utf8(src, dest)
      inpath = File.expand_path(src)
      outpath = File.expand_path(dest)

      m, src_enc = *@head.match(/encoding=.([a-zA-Z0-9\-]+)./i)

      # ensure the file is actually utf8
      if `isutf8 #{inpath}`.strip == ""
        if src_enc.to_s.downcase == "utf-8"
          FileUtils.cp(inpath, outpath)
        else
          FileUtils.cp(inpath, outpath)
          `sed -e 's/<?xml.*?>/<?xml version=\"1.0\" encoding=\"UTF-8\"?>/' -i tmp #{outpath}`
        end
      elsif src_enc
        `iconv --from-code=#{src_enc} --to-code=UTF-8 #{inpath} > #{outpath}`
        `sed -e 's/#{src_enc}/UTF-8/' -i tmp #{outpath}`
      else
          FileUtils.cp(inpath, outpath)
      end
    end

    # XML files shouldn't contain low ASCII control chars. Strip them.
    #
    def remove_control_chars(src, dest)
      inpath = File.expand_path(src)
      outpath = File.expand_path(dest)
      `cat #{inpath} | tr -d "\\000-\\010\\013\\014\\016-\\037" > #{outpath}`
    end

    # replace all named entities in the specified file with
    # numeric entities.
    #
    def replace_named_entities(path)
      # TODO: this is horrible. 1500 sed calls.
      entity_map.each do |named, numeric|
        `sed -e 's/\\&#{named};/\\&#{numeric};/g' -i tmp #{path}`
      end
    end

    # return a named entity to numeric entity mapping, build by extracting
    # data from the ONIX DTD
    #
    def entity_map
      return @map if @map

      path = File.dirname(__FILE__) + "/../../support/entities.txt"
      @map = {}
      File.read(path).split.each do |line|
        elements = line.split(":")
        @map[elements.first] = elements.last
      end
      @map
    end

  end

end
