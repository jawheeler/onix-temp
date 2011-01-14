# coding: utf-8

module ONIX
  class SupplyDetail
    include ROXML
    include ONIX::Common

    xml_name "SupplyDetail"

    xml_accessor :supplier_ean_location_number, :from => "SupplierEANLocationNumber"
    xml_accessor :supplier_san, :from => "SupplierSAN"
    xml_accessor :supplier_name, :from => "SupplierName"
    xml_accessor :telephone_number, :from => "TelephoneNumber"
    xml_accessor :fax_number, :from => "FaxNumber"
    xml_accessor :email_address, :from => "EmailAddress"
    xml_accessor :websites, :from => "Website", :as => [ONIX::Website]
    xml_accessor :supplier_role, :from => "SupplierRole", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :supply_to_country, :from => "SupplyToCountry"
    xml_accessor :supply_to_territory, :from => "SupplyToTerritory"
    xml_accessor :availability_code, :from => "AvailabilityCode"
    xml_accessor :product_availability, :from => "ProductAvailability", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor(:expected_ship_date, :from => "ExpectedShipDate", :to_xml => ONIX::Formatters.yyyymmdd) do |val|
      begin
        Date.parse(val)
      rescue
        nil
      end
    end
    
    xml_accessor :stock, :from => "Stock", :as => [ONIX::Stock]
    xml_accessor :prices, :from => "Price", :as => [ONIX::Price]
    
    xml_accessor :short_supplier_ean_location_number, :from => "j135"
    xml_accessor :short_supplier_san, :from => "j136"
    xml_accessor :short_supplier_name, :from => "j137"
    xml_accessor :short_telephone_number, :from => "j270"
    xml_accessor :short_fax_number, :from => "j271"
    xml_accessor :short_email_address, :from => "j272"
    xml_accessor :short_websites, :from => "website", :as => [ONIX::Website]
    xml_accessor :short_supplier_role, :from => "j292", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_supply_to_country, :from => "j138"
    xml_accessor :short_supply_to_territory, :from => "j397"
    xml_accessor :short_availability_code, :from => "j141"
    xml_accessor :short_product_availability, :from => "j396", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor(:short_expected_ship_date, :from => "j142", :to_xml => ONIX::Formatters.yyyymmdd) do |val|
      begin
        Date.parse(val)
      rescue
        nil
      end
    end
    xml_accessor :short_stock, :from => "stock", :as => [ONIX::Stock]
    xml_accessor :short_prices, :from => "price", :as => [ONIX::Price]

    def initialize
      self.websites = []
      self.stock = []
      self.prices = []
    end
  end
end
