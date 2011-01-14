# coding: utf-8

require 'rubygems'
require 'bigdecimal'
require 'cgi'

# ensure we load the correct gem versions
gem 'roxml', '2.5.3.1.br'
gem 'andand'

# and now load the actual gems
require 'roxml'
require 'andand'

module ONIX
  module Version #:nodoc:
    Major = 0
    Minor = 7
    Tiny  = 6
    Build = "br"

    String = [Major, Minor, Tiny, Build].join('.')
  end

  class Formatters
    def self.decimal
      lambda do |val|
        if val.nil?
          nil
        elsif val.kind_of?(BigDecimal)
          val.to_s("F")
        else
          val.to_s
        end
      end
    end

    def self.yyyymmdd
      lambda do |val|
        if val.nil? || !val.respond_to?(:strftime)
          nil
        else
          val.strftime("%Y%m%d")
        end
      end
    end

    def self.two_digit
      lambda do |val|
        if val.nil?
          nil
        elsif val < 10
          "0#{val}"
        elsif val > 99
          val.to_s[-2,2]
        else
          val.to_s
        end
      end
    end
  end
end

# silence some warnings from ROXML
unless ROXML.const_defined?("SILENCE_XML_NAME_WARNING")
  ROXML::SILENCE_XML_NAME_WARNING = true
end

require File.join(File.dirname(__FILE__), "onix", "common")

# core files
# - ordering is important, classes need to be defined before any
#   other class can use them
require File.join(File.dirname(__FILE__), "onix", "sender_identifier")
require File.join(File.dirname(__FILE__), "onix", "addressee_identifier")
require File.join(File.dirname(__FILE__), "onix", "header")
require File.join(File.dirname(__FILE__), "onix", "language")
require File.join(File.dirname(__FILE__), "onix", "product_identifier")
require File.join(File.dirname(__FILE__), "onix", "title")
require File.join(File.dirname(__FILE__), "onix", "website")
require File.join(File.dirname(__FILE__), "onix", "contributor")
require File.join(File.dirname(__FILE__), "onix", "subject")
require File.join(File.dirname(__FILE__), "onix", "other_text")
require File.join(File.dirname(__FILE__), "onix", "media_file")
require File.join(File.dirname(__FILE__), "onix", "imprint")
require File.join(File.dirname(__FILE__), "onix", "publisher")
require File.join(File.dirname(__FILE__), "onix", "sales_restriction")
require File.join(File.dirname(__FILE__), "onix", "stock")
require File.join(File.dirname(__FILE__), "onix", "price")
require File.join(File.dirname(__FILE__), "onix", "supply_detail")
require File.join(File.dirname(__FILE__), "onix", "market_representation")
require File.join(File.dirname(__FILE__), "onix", "measure")
require File.join(File.dirname(__FILE__), "onix", "related_product")
require File.join(File.dirname(__FILE__), "onix", "product_form_feature")
require File.join(File.dirname(__FILE__), "onix", "contained_item")
require File.join(File.dirname(__FILE__), "onix", "not_for_sale")
require File.join(File.dirname(__FILE__), "onix", "product")
require File.join(File.dirname(__FILE__), "onix", "reader")
require File.join(File.dirname(__FILE__), "onix", "writer")

# lists
require File.join(File.dirname(__FILE__), "onix", "lists", "product_form")
require File.join(File.dirname(__FILE__), "onix", "lists", "product_availability")
require File.join(File.dirname(__FILE__), "onix", "lists", "notification_type")
require File.join(File.dirname(__FILE__), "onix", "lists", "availability_status_code")
require File.join(File.dirname(__FILE__), "onix", "lists", "language_code")




# product wrappers
require File.join(File.dirname(__FILE__), "onix", "simple_product")
require File.join(File.dirname(__FILE__), "onix", "apa_product")

# misc
require File.join(File.dirname(__FILE__), "onix", "normaliser")
