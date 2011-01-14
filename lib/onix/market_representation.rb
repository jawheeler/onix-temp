# coding: utf-8

module ONIX
  class MarketRepresentation
    include ROXML
    include ONIX::Common

    xml_name "MarketRepresentation"

    xml_accessor :agent_name, :from => "AgentName"
    xml_accessor :agent_role, :from => "AgentRole", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :market_country, :from => "MarketCountry"
    xml_accessor :market_territory, :from => "MarketTerritory"
    xml_accessor :market_country_excluded, :from => "MarketCountryExcluded"
    xml_accessor :market_restriction_detail, :from => "MarketRestrictionDetail"
    xml_accessor :market_publishing_status, :from => "MarketPublishingStatus", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    
    xml_accessor :short_agent_name, :from => "j401"
    xml_accessor :short_agent_role, :from => "j402", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_market_country, :from => "j403"
    xml_accessor :short_market_territory, :from => "j404"
    xml_accessor :short_market_country_excluded, :from => "j405"
    xml_accessor :short_market_restriction_detail, :from => "j406"
    xml_accessor :short_market_publishing_status, :from => "j407", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
  end
end

