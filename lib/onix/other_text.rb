# coding: utf-8

module ONIX
  class OtherText
    include ROXML
    include ONIX::Common

    xml_name "OtherText"

    xml_accessor :text_type_code, :from => "TextTypeCode", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :text_format,    :from => "TextFormat"
    xml_accessor :text,           :from => "Text"
    xml_accessor :text_link_type, :from => "TextLinkType", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :text_link,      :from => "TextLink"
    xml_accessor :text_author,    :from => "TextAuthor"
    
    xml_accessor :short_text_type_code, :from => "d102", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_text_format,    :from => "d103"
    xml_accessor :short_text,           :from => "d104"
    xml_accessor :short_text_link_type, :from => "d105", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_text_link,      :from => "d106"
    xml_accessor :short_text_author,    :from => "d107"
  end
end
