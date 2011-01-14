# coding: utf-8

module ONIX
  class Product
    include ROXML
    include ONIX::Common

    xml_name "Product"

    xml_accessor :record_reference, :from => "RecordReference"
    xml_accessor :notification_type, :from => "NotificationType", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :languages, :from => "Language", :as => [ONIX::Language]
    xml_accessor :product_identifiers, :from => "ProductIdentifier", :as => [ONIX::ProductIdentifier]
    xml_accessor :product_form, :from => "ProductForm"
    xml_accessor :product_form_description, :from => "ProductFormDescription"
    xml_accessor :series, :from => "Series"
    xml_accessor :contained_items, :from => "ContainedItem", :as => [ONIX::ContainedItem]
    xml_accessor :edition_number, :from => "EditionNumber", :as => Fixnum
    xml_accessor :edition_statement, :from => "EditionStatement"
    xml_accessor :titles, :from => "Title", :as => [ONIX::Title]
    xml_accessor :websites, :from => "Website", :as => [ONIX::Website]
    xml_accessor :contributors, :from => "Contributor", :as => [ONIX::Contributor]
    xml_accessor :number_of_pages, :from => "NumberOfPages", :as => Fixnum
    xml_accessor :pages_roman, :from => "PagesRoman", :as => Fixnum
    xml_accessor :pages_arabic, :from => "PagesArabic", :as => Fixnum
    xml_accessor :bic_main_subject, :from => "BICMainSubject"
    xml_accessor :subjects, :from => "Subject", :as => [ONIX::Subject]
    xml_accessor :text, :from => "OtherText", :as => [ONIX::OtherText]
    xml_accessor :media_files, :from => "MediaFile", :as => [ONIX::MediaFile]
    xml_accessor :imprints, :from => "Imprint", :as => [ONIX::Imprint]
    xml_accessor :publishers, :from => "Publisher", :as => [ONIX::Publisher]
    xml_accessor :publishing_status, :from => "PublishingStatus", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor(:publication_date, :from => "PublicationDate", :to_xml => ONIX::Formatters.yyyymmdd) do |val|
      begin
        val = val.to_s
        while(val.length < 8)
          val = val + '01'
        end      
        Date.parse(val)
      rescue
        nil
      end
    end
    xml_accessor :year_first_published, :from => "YearFirstPublished", :as => Fixnum
    xml_accessor :sales_restrictions, :from => "SalesRestriction", :as => [ONIX::SalesRestriction]
    xml_accessor :measurements, :from => "Measure", :as => [ONIX::Measure]
    xml_accessor :related_products, :from => "RelatedProduct", :as => [ONIX::RelatedProduct]
    xml_accessor :supply_details, :from => "SupplyDetail", :as => [ONIX::SupplyDetail]
    xml_accessor :not_for_sales, :from => "NotForSale", :as => [ONIX::NotForSale]
    
    xml_accessor :market_representations, :from => "MarketRepresentation", :as => [ONIX::MarketRepresentation]

    # some deprecated attributes. Read only
    # - See the measures array for the current way of specifying
    #   various measurements of the product
    xml_reader :height,     :from => "Height", :as => BigDecimal
    xml_reader :width,      :from => "Width", :as => BigDecimal
    xml_reader :thickness,  :from => "Thickness", :as => BigDecimal
    xml_reader :weight,     :from => "Weight", :as => BigDecimal
    xml_reader :dimensions, :from => "Dimensions"
    
    
    xml_accessor :short_record_reference, :from => "a001"
    xml_accessor :short_notification_type, :from => "a002", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_languages, :from => "language", :as => [ONIX::Language]
    xml_accessor :short_product_identifiers, :from => "productidentifier", :as => [ONIX::ProductIdentifier]
    xml_accessor :short_product_form, :from => "b012"
    xml_accessor :short_product_form_description, :from => "b014"
    
    xml_accessor :short_contained_items, :from => "containeditem", :as => [ONIX::ContainedItem]
    xml_accessor :short_series, :from => "series"
    xml_accessor :short_edition_number, :from => "b057", :as => Fixnum
    xml_accessor :short_edition_statement, :from => "b058"   
    xml_accessor :short_titles, :from => "title", :as => [ONIX::Title]
    xml_accessor :short_websites, :from => "website", :as => [ONIX::Website]
    xml_accessor :short_contributors, :from => "contributor", :as => [ONIX::Contributor]
    xml_accessor :short_number_of_pages, :from => "b061", :as => Fixnum
    xml_accessor :short_pages_roman, :from => "b254", :as => Fixnum
    xml_accessor :short_pages_arabic, :from => "b255", :as => Fixnum
    xml_accessor :short_bic_main_subject, :from => "b065"
    xml_accessor :short_subjects, :from => "subject", :as => [ONIX::Subject]
    xml_accessor :short_text, :from => "othertext", :as => [ONIX::OtherText]
    xml_accessor :short_media_files, :from => "mediafile", :as => [ONIX::MediaFile]
    xml_accessor :short_imprints, :from => "imprint", :as => [ONIX::Imprint]
    xml_accessor :short_publishers, :from => "publisher", :as => [ONIX::Publisher]
    xml_accessor :short_publishing_status, :from => "b394", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor(:short_publication_date, :from => "b003", :to_xml => ONIX::Formatters.yyyymmdd) do |val|
      begin
        val = val.to_s
        while(val.length < 8)
          val = val + '01'
        end
        Date.parse(val)
      rescue
        nil
      end
    end
    xml_accessor :short_year_first_published, :from => "b088", :as => Fixnum
    xml_accessor :short_sales_restrictions, :from => "salesrestriction", :as => [ONIX::SalesRestriction]
    xml_accessor :short_measurements, :from => "measure", :as => [ONIX::Measure]
    xml_accessor :short_related_products, :from => "relatedproduct", :as => [ONIX::RelatedProduct]
    xml_accessor :short_supply_details, :from => "supplydetail", :as => [ONIX::SupplyDetail]
    xml_accessor :short_market_representations, :from => "marketrepresentation", :as => [ONIX::MarketRepresentation]
    xml_accessor :short_not_for_sales, :from => "notforsale", :as => [ONIX::NotForSale]

    # some deprecated attributes. Read only
    # - See the measures array for the current way of specifying
    #   various measurements of the product
    xml_reader :short_height,     :from => "c096", :as => BigDecimal
    xml_reader :short_width,      :from => "c097", :as => BigDecimal
    xml_reader :short_thickness,  :from => "c098", :as => BigDecimal
    xml_reader :short_weight,     :from => "c099", :as => BigDecimal
    xml_reader :short_dimensions, :from => "c258"

    def initialize
      self.languages = []
      self.product_identifiers = []
      self.titles = []
      self.contained_items = []
      self.contributors = []
      self.websites = []
      self.subjects = []
      self.text = []
      self.media_files = []
      self.imprints = []
      self.publishers = []
      self.sales_restrictions = []
      self.measurements = []
      self.related_products = []
      self.supply_details = []
      self.not_for_sales = []
      self.market_representations = []
    end
        
  end
end
