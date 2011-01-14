# coding: utf-8

module ONIX
  class RelatedProduct
    include ROXML
    include ONIX::Common

    xml_name "RelatedProduct"

    xml_accessor :relation_code, :from => "RelationCode", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :product_identifiers, :from => "ProductIdentifier", :as => [ONIX::ProductIdentifier]
    
    xml_accessor :short_relation_code, :from => "h208", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_product_identifiers, :from => "productidentifier", :as => [ONIX::ProductIdentifier]
    
    def initialize
      self.product_identifiers = []
    end
  end
end
