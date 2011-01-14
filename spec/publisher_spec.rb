# coding: utf-8

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'onix'

context "ONIX::Publisher" do

  before(:each) do
    data_path = File.join(File.dirname(__FILE__),"..","data")
    file1    = File.join(data_path, "publisher.xml")
    @doc = LibXML::XML::Document.file(file1)
    @root = @doc.root
  end

  specify "should correctly convert to a string" do
    pub = ONIX::Publisher.from_xml(@root.to_s)
    pub.to_xml.to_s[0,11].should eql("<Publisher>")
  end

  specify "should provide read access to first level attibutes" do
    pub = ONIX::Publisher.from_xml(@root.to_s)
    pub.publishing_role.should eql(1)
    pub.publisher_name.should eql("Desbooks Publishing")
  end

  specify "should provide write access to first level attibutes" do
    pub = ONIX::Publisher.new

    pub.publisher_name = "Paulist Press"
    pub.to_xml.to_s.include?("<PublisherName>Paulist Press</PublisherName>").should be_true

    pub.publishing_role = 2
    pub.to_xml.to_s.include?("<PublishingRole>02</PublishingRole>").should be_true
  end

end

