# coding: utf-8

module ONIX
  class Imprint
    include ROXML
    include ONIX::Common

    xml_name "Imprint"

    xml_accessor :name_code_type,      :from => "NameCodeType", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :name_code_type_name, :from => "NameCodeTypeName"
    xml_accessor :name_code_value,     :from => "NameCodeValue"
    xml_accessor :imprint_name,        :from => "ImprintName"
    
    xml_accessor :short_name_code_type,      :from => "b241", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_name_code_type_name, :from => "b242"
    xml_accessor :short_name_code_value,     :from => "b243"
    xml_accessor :short_imprint_name,        :from => "b079"
  end
end
