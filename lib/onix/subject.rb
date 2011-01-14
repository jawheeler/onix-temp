# coding: utf-8

module ONIX
  class Subject
    include ROXML
    include ONIX::Common

    xml_name "Subject"

    xml_accessor :subject_scheme_id,      :from => "SubjectSchemeIdentifier", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :subject_scheme_name,    :from => "SubjectSchemeName"
    xml_accessor :subject_scheme_version, :from => "SubjectSchemeVersion"
    xml_accessor :subject_code,           :from => "SubjectCode"
    xml_accessor :subject_heading_text,   :from => "SubjectHeadingText"
    
    xml_accessor :short_subject_scheme_id,      :from => "b067", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_subject_scheme_name,    :from => "b171"
    xml_accessor :short_subject_scheme_version, :from => "b068"
    xml_accessor :short_subject_code,           :from => "b069"
    xml_accessor :short_subject_heading_text,   :from => "b070"
  end
end
