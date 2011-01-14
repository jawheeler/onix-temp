# coding: utf-8

module ONIX
  class Title
    include ROXML 
    include ONIX::Common

    xml_name "Title"

    xml_accessor :title_type, :from => "TitleType", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :title_text, :from => "TitleText"
    xml_accessor :title_prefix, :from => "TitlePrefix"
    xml_accessor :title_without_prefix, :from => "TitleWithoutPrefix"
    xml_accessor :subtitle,   :from => "Subtitle"
    
    xml_accessor :short_title_type, :from => "b202", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_title_text, :from => "b203"
    xml_accessor :short_title_prefix, :from => "b030"
    xml_accessor :short_title_without_prefix, :from => "b031"
    xml_accessor :short_subtitle,   :from => "b029"

  end
end
