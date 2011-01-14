# coding: utf-8

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'onix'

context "ONIX::OtherText" do

  before(:each) do
    data_path = File.join(File.dirname(__FILE__),"..","data")
    file1    = File.join(data_path, "other_text.xml")
    @doc = LibXML::XML::Document.file(file1)
    @root = @doc.root
  end

  specify "should correctly convert to a string" do
    ot = ONIX::OtherText.from_xml(@root.to_s)
    ot.to_xml.to_s[0,11].should eql("<OtherText>")
  end

  specify "should provide read access to first level attibutes" do
    ot = ONIX::OtherText.from_xml(@root.to_s)

    ot.text_type_code.should eql(2)
    ot.text[0,7].should eql("A woman")
  end

  specify "should provide write access to first level attibutes" do
    ot = ONIX::OtherText.new

    ot.text_type_code = 2
    ot.to_xml.to_s.include?("<TextTypeCode>02</TextTypeCode>").should be_true

    ot.text = "James Healy"
    ot.to_xml.to_s.include?("<Text>James Healy</Text>").should be_true

  end

end

