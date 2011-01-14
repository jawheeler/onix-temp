# coding: utf-8

module ONIX
  class MediaFile
    include ROXML
    include ONIX::Common

    xml_name "MediaFile"

    xml_accessor :media_file_type_code, :from => "MediaFileTypeCode", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :media_file_format_code, :from => "MediaFileFormatCode", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :image_resolution, :from => "ImageResolution"
    xml_accessor :media_file_link_type_code, :from => "MediaFileLinkTypeCode", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :media_file_link, :from => "MediaFileLink"
    
    xml_accessor :short_media_file_type_code, :from => "f114", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_media_file_format_code, :from => "f115", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_image_resolution, :from => "f259"
    xml_accessor :short_media_file_link_type_code, :from => "f116", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_media_file_link, :from => "f117"
  end
end
