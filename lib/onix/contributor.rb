# coding: utf-8

module ONIX
  class Contributor
    include ROXML
    include ONIX::Common

    xml_name "Contributor"

    xml_accessor :sequence_number,      :from => "SequenceNumber", :as => Fixnum
    xml_accessor :contributor_role,     :from => "ContributorRole"
    xml_accessor :language_code,        :from => "LanguageCode"
    xml_accessor :sequence_number_within_role,  :from => "SequenceNumberWithinRole", :as => Fixnum
    xml_accessor :person_name,          :from => "PersonName"
    xml_accessor :person_name_inverted, :from => "PersonNameInverted"
    xml_accessor :titles_before_names,  :from => "TitlesBeforeNames"
    xml_accessor :names_before_key,     :from => "NamesBeforeKey"
    xml_accessor :prefix_to_key,        :from => "PrefixToKey"
    xml_accessor :key_names,            :from => "KeyNames"
    xml_accessor :names_after_key,      :from => "NamesAfterKey"
    xml_accessor :suffix_to_key,        :from => "SuffixToKey"
    xml_accessor :letters_after_names,  :from => "LettersAfterNames"
    xml_accessor :titles_after_names,   :from => "TitlesAfterNames"
    xml_accessor :corporate_name,       :from => "CorporateName"
    xml_accessor :biographical_note,    :from => "BiographicalNote"
    
    xml_accessor :short_sequence_number,      :from => "b034", :as => Fixnum
    xml_accessor :short_contributor_role,     :from => "b035"
    xml_accessor :short_language_code,        :from => "b252"
    xml_accessor :short_sequence_number_within_role,  :from => "b340", :as => Fixnum
    xml_accessor :short_person_name,          :from => "b036"
    xml_accessor :short_person_name_inverted, :from => "b037"
    xml_accessor :short_titles_before_names,  :from => "b038"
    xml_accessor :short_names_before_key,     :from => "b039"
    xml_accessor :short_prefix_to_key,        :from => "b247"
    xml_accessor :short_key_names,            :from => "b040"
    xml_accessor :short_names_after_key,      :from => "b041"
    xml_accessor :short_suffix_to_key,        :from => "b248"
    xml_accessor :short_letters_after_names,  :from => "b042"
    xml_accessor :short_titles_after_names,   :from => "b043"
    xml_accessor :short_corporate_name,       :from => "b047"
    xml_accessor :short_biographical_note,    :from => "b044"
  end
end
