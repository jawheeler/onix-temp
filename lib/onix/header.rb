# coding: utf-8

module ONIX
  class Header
    include ROXML
    include ONIX::Common
    
    xml_name "Header"

    xml_accessor :from_ean_number, :from => "FromEANNumber"
    xml_accessor :from_san,        :from => "FromSAN"
    xml_accessor :sender_identifiers, :from => "SenderIdentifier", :as => [ONIX::SenderIdentifier]
    xml_accessor :from_company,    :from => "FromCompany"
    xml_accessor :from_person,     :from => "FromPerson"
    xml_accessor :from_email,      :from => "FromEmail"
    xml_accessor :to_ean_number,   :from => "ToEANNumber"
    xml_accessor :to_san,          :from => "ToSAN"
    xml_accessor :addressee_identifiers, :from => "AddresseeIdentifier", :as => [ONIX::AddresseeIdentifier]
    xml_accessor :to_company,      :from => "ToCompany"
    xml_accessor :to_person,       :from => "ToPerson"
    xml_accessor :message_number,  :from => "MessageNumber"
    xml_accessor :message_repeat,  :from => "MessageRepeat", :as => Fixnum
    xml_accessor(:sent_date,       :from => "SentDate", :to_xml => ONIX::Formatters.yyyymmdd) do |val|
      begin
        Date.parse(val)
      rescue
        nil
      end
    end
    xml_accessor :message_note,    :from => "MessageNote"

    # defaults
    xml_accessor  :default_language_of_text, :from => "DefaultLanguageOfText"
    xml_accessor  :default_price_type_code, :from => "DefaultPriceTypeCode", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor  :default_currency_code,   :from => "DefaultCurrencyCode"
    xml_reader    :default_linear_unit,     :from => "DefaultLinearUnit"        # deprecated in ONIX spec
    xml_reader    :default_weight_unit,     :from => "DefaultWeightUnit"        # deprecated in ONIX spec
    xml_accessor  :default_class_of_trade,  :from => "DefaultClassOfTrade"



    xml_accessor :short_from_ean_number, :from => "m172"
    xml_accessor :short_from_san,        :from => "m173"
    xml_accessor :short_sender_identifiers, :from => "senderidentifier", :as => [ONIX::SenderIdentifier]
    xml_accessor :short_from_company,    :from => "m174"
    xml_accessor :short_from_person,     :from => "m175"
    xml_accessor :short_from_email,      :from => "m283"
    xml_accessor :short_to_ean_number,   :from => "m176"
    xml_accessor :short_to_san,          :from => "m177"
    xml_accessor :short_addressee_identifiers, :from => "addresseeidentifier", :as => [ONIX::AddresseeIdentifier]
    xml_accessor :short_to_company,      :from => "m178"
    xml_accessor :short_to_person,       :from => "m179"
    xml_accessor :short_message_number,  :from => "m180"
    xml_accessor :short_message_repeat,  :from => "m181", :as => Fixnum
    xml_accessor(:short_sent_date,       :from => "m182", :to_xml => ONIX::Formatters.yyyymmdd) do |val|
      begin
        Date.parse(val)
      rescue
        nil
      end
    end
    xml_accessor :short_message_note,    :from => "m183"

    # defaults
    xml_accessor  :short_default_language_of_text, :from => "m184"
    xml_accessor  :short_default_price_type_code, :from => "m185", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor  :short_default_currency_code,   :from => "m186"
    xml_reader    :short_default_linear_unit,     :from => "m187"        # deprecated in ONIX spec
    xml_reader    :short_default_weight_unit,     :from => "m188"        # deprecated in ONIX spec
    xml_accessor  :short_default_class_of_trade,  :from => "m193"


    def initialize
      self.sender_identifiers = []
      self.addressee_identifiers = []
    end
  end

end
