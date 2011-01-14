# coding: utf-8

module ONIX
  class NotForSale
    include ROXML
    include ONIX::Common

    xml_name "NotForSale"

    xml_accessor :rights_country, :from => "RightsCountry"
    xml_accessor :rights_territory, :from => "RightsTerritory"
    xml_accessor :product_identifiers, :from => "ProductIdentifier", :as => [ONIX::ProductIdentifier]
    
    xml_accessor :short_rights_country, :from => "b090"
    xml_accessor :short_rights_territory, :from => "b388"
    xml_accessor :short_product_identifiers, :from => "productidentifier", :as => [ONIX::ProductIdentifier]
    
    def initialize
      self.product_identifiers = []
    end
  end
end
