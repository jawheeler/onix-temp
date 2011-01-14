# coding: utf-8

module ONIX
  class ContainedItem
    include ROXML
    include ONIX::Common

    xml_name "ContainedItem"

    xml_accessor :product_identifiers, :from => "ProductIdentifier", :as => [ONIX::ProductIdentifier]
    xml_accessor :product_form, :from => "ProductForm"
    xml_accessor :product_form_detail, :from => "ProductFormDetail"
    xml_accessor :product_form_features, :from => "ProductFormFeature", :as => [ONIX::ProductFormFeature]
    xml_accessor :product_packaging, :from => "ProductPackaging", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :product_form_description, :from => "ProductFormDescription"
    xml_accessor :number_of_pieces, :from => "NumberOfPieces"
    xml_accessor :trade_category, :from => "TradeCategory", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :product_content_type, :from => "ProductContentType", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :item_quantity, :from => "ItemQuantity"
    
    
    xml_accessor :short_product_identifiers, :from => "productidentifier", :as => [ONIX::ProductIdentifier]
    xml_accessor :short_product_form, :from => "b012"
    xml_accessor :short_product_form_detail, :from => "b333"
    xml_accessor :short_product_form_features, :from => "productformfeature", :as => [ONIX::ProductFormFeature]
    xml_accessor :short_product_packaging, :from => "b225", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_product_form_description, :from => "b014"
    xml_accessor :short_number_of_pieces, :from => "b210"
    xml_accessor :short_trade_category, :from => "b384", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_product_content_type, :from => "b385", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_item_quantity, :from => "b015"
    
  end
  
  def initialize
    self.product_identifiers = []
    self.product_form_features = []
  end
  
end
