# coding: utf-8

module ONIX
  class Publisher
    include ROXML
    include ONIX::Common

    xml_name "Publisher"

    xml_accessor :publishing_role,      :from => "PublishingRole", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :name_code_type,       :from => "NameCodeType", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :name_code_type_name,  :from => "NameCodeTypeName"
    xml_accessor :name_code_type_value, :from => "NameCodeTypeValue"
    xml_accessor :publisher_name,       :from => "PublisherName"
    
    xml_accessor :short_publishing_role,      :from => "b291", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_name_code_type,       :from => "b241", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_name_code_type_name,  :from => "b242"
    xml_accessor :short_name_code_type_value, :from => "b243"
    xml_accessor :short_publisher_name,       :from => "b081"
  end
end
