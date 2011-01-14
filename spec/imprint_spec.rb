# coding: utf-8

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'onix'

context "ONIX::Imprint" do

  before(:each) do
    data_path = File.join(File.dirname(__FILE__),"..","data")
    file1    = File.join(data_path, "imprint.xml")
    @doc = LibXML::XML::Document.file(file1)
    @root = @doc.root
  end

  specify "should correctly convert to a string" do
    imp = ONIX::Imprint.from_xml(@root.to_s)
    imp.to_xml.to_s[0,9].should eql("<Imprint>")
  end

  specify "should provide read access to first level attibutes" do
    imp = ONIX::Imprint.from_xml(@root.to_s)

    imp.imprint_name.should eql("Oxford University Press UK")
  end

  specify "should provide write access to first level attibutes" do
    imp = ONIX::Imprint.new

    imp.imprint_name = "Paulist Press"
    imp.to_xml.to_s.include?("<ImprintName>Paulist Press</ImprintName>").should be_true

    imp.name_code_type = 1
    imp.to_xml.to_s.include?("<NameCodeType>01</NameCodeType>").should be_true

  end

end

