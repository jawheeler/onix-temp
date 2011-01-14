# coding: utf-8

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'onix'

context "ONIX::Stock" do

  before(:each) do
    data_path = File.join(File.dirname(__FILE__),"..","data")
    file1    = File.join(data_path, "stock.xml")
    @doc = LibXML::XML::Document.file(file1)
    @root = @doc.root
  end

  specify "should correctly convert to a string" do
    s = ONIX::Stock.from_xml(@root.to_s)
    s.to_xml.to_s[0,7].should eql("<Stock>")
  end

  specify "should provide read access to first level attibutes" do
    s = ONIX::Stock.from_xml(@root.to_s)

    # note that these fields *should* be numeric according to the ONIX spec,
    # however heaps of ONIX files in the wild have strings there.
    s.on_hand.should eql("2862")
    s.on_order.should eql("0")
  end

  specify "should provide write access to first level attibutes" do
    s = ONIX::Stock.new

    s.on_hand = "123"
    s.to_xml.to_s.include?("<OnHand>123</OnHand>").should be_true

    s.on_order = "011"
    s.to_xml.to_s.include?("<OnOrder>011</OnOrder>").should be_true

    s.on_order = 11
    s.to_xml.to_s.include?("<OnOrder>11</OnOrder>").should be_true
  end

end

