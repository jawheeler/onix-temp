# coding: utf-8

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'onix'

context "ONIX::SalesRestriction" do

  before(:each) do
    data_path = File.join(File.dirname(__FILE__),"..","data")
    file1    = File.join(data_path, "sales_restriction.xml")
    @doc = LibXML::XML::Document.file(file1)
    @root = @doc.root
  end

  specify "should correctly convert to a string" do
    sr = ONIX::SalesRestriction.from_xml(@root.to_s)
    sr.to_xml.to_s[0,18].should eql("<SalesRestriction>")
  end

  specify "should provide read access to first level attibutes" do
    sr = ONIX::SalesRestriction.from_xml(@root.to_s)

    sr.sales_restriction_type.should eql(0)
  end

  specify "should provide write access to first level attibutes" do
    sr = ONIX::SalesRestriction.new

    sr.sales_restriction_type = 1
    sr.to_xml.to_s.include?("<SalesRestrictionType>01</SalesRestrictionType>").should be_true
  end

end

