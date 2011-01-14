# coding: utf-8

module ONIX
  class Price
    include ROXML
    include ONIX::Common

    xml_name "Price"

    xml_accessor :price_type_code, :from => "PriceTypeCode", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :price_type_qualifier, :from => "PriceTypeQualifier", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :price_type_description, :from => "PriceTypeDescription"
    xml_accessor :price_per, :from => "PricePer", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :minimum_order_qty, :from => "MinimumOrderQuantity", :as => Fixnum
    xml_accessor :class_of_trade, :from => "ClassOfTrade"
    xml_accessor :bic_discount_group_code, :from => "BICDiscountGroupCode"
    xml_accessor :price_status, :from => "PriceStatus", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :price_amount, :from => "PriceAmount", :as => BigDecimal, :to_xml => ONIX::Formatters.decimal
    xml_accessor :currency_code, :from => "CurrencyCode"
    
    xml_accessor :short_price_type_code, :from => "j148", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_price_type_qualifier, :from => "j261", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_price_type_description, :from => "j262"
    xml_accessor :short_price_per, :from => "j239", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_minimum_order_qty, :from => "j263", :as => Fixnum
    xml_accessor :short_class_of_trade, :from => "j149"
    xml_accessor :short_bic_discount_group_code, :from => "j150"
    xml_accessor :short_price_status, :from => "j266", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_price_amount, :from => "j151", :as => BigDecimal, :to_xml => ONIX::Formatters.decimal
    xml_accessor :short_currency_code, :from => "j152"
  end
end
