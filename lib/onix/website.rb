# coding: utf-8

module ONIX
  class Website
    include ROXML
    include ONIX::Common

    xml_name "Website"

    xml_accessor :website_role,        :from => "WebsiteRole", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :website_description, :from => "WebsiteDescription"
    xml_accessor :website_link,        :from => "WebsiteLink"
    
    xml_accessor :short_website_role,        :from => "b367", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_website_description, :from => "b294"
    xml_accessor :short_website_link,        :from => "b295"
  end
end
