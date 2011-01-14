# coding: utf-8

module ONIX
  class ProductFormFeature
    include ROXML
    include ONIX::Common

    xml_name "ProductFormFeature"

    xml_accessor :product_form_feature_type, :from => "ProductFormFeatureType", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :product_form_feature_value,       :from => "ProductFormFeatureValue"
    xml_accessor :product_form_feature_description, :from => "ProductFormFeatureDescription"
    
    xml_accessor :short_product_form_feature_type,  :from => "b334", :as => Fixnum, :to_xml => ONIX::Formatters.two_digit
    xml_accessor :short_product_form_feature_value,   :from => "b335"
    xml_accessor :short_product_form_feature_description, :from => "b336"
  end
end
