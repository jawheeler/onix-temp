# coding: utf-8

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'onix'

context "ONIX::Price" do

  before(:each) do
    data_path = File.join(File.dirname(__FILE__),"..","data")
    file1    = File.join(data_path, "price.xml")
    @doc = LibXML::XML::Document.file(file1)
    @root = @doc.root
  end

  specify "should correctly convert to a string" do
    p = ONIX::Price.from_xml(@root.to_s)
    p.to_xml.to_s[0,7].should eql("<Price>")
  end

  specify "should provide read access to first level attibutes" do
    p = ONIX::Price.from_xml(@root.to_s)

    p.price_type_code.should eql(2)
    p.price_amount.should eql(BigDecimal.new("7.5"))
  end

  specify "should provide write access to first level attibutes" do
    p = ONIX::Price.new

    p.price_type_code = 1
    p.to_xml.to_s.include?("<PriceTypeCode>01</PriceTypeCode>").should be_true

    p.price_amount = BigDecimal.new("7.5")
    p.to_xml.to_s.include?("<PriceAmount>7.5</PriceAmount>").should be_true

  end

end

