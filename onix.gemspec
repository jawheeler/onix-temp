# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{onix}
  s.version = "0.7.6.2.br"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Healy"]
  s.date = %q{2010-07-12}
  s.description = %q{A convient mapping between ruby objects and the ONIX XML specification}
  s.email = %q{jimmy@deefa.com}
  s.files = ["lib/onix/addressee_identifier.rb", "lib/onix/apa_product.rb", "lib/onix/common.rb", "lib/onix/contained_item.rb", "lib/onix/contributor.rb", "lib/onix/header.rb", "lib/onix/imprint.rb", "lib/onix/language.rb", "lib/onix/lists/availability_status_code.rb", "lib/onix/lists/language_code.rb", "lib/onix/lists/notification_type.rb", "lib/onix/lists/product_availability.rb", "lib/onix/lists/product_form.rb", "lib/onix/market_representation.rb", "lib/onix/measure.rb", "lib/onix/media_file.rb", "lib/onix/normaliser.rb", "lib/onix/not_for_sale.rb", "lib/onix/other_text.rb", "lib/onix/price.rb", "lib/onix/product.rb", "lib/onix/product_form_feature.rb", "lib/onix/product_identifier.rb", "lib/onix/publisher.rb", "lib/onix/reader.rb", "lib/onix/related_product.rb", "lib/onix/sales_restriction.rb", "lib/onix/sender_identifier.rb", "lib/onix/simple_product.rb", "lib/onix/stock.rb", "lib/onix/subject.rb", "lib/onix/supply_detail.rb", "lib/onix/title.rb", "lib/onix/website.rb", "lib/onix/writer.rb", "lib/onix.rb", "README.markdown", "TODO", "CHANGELOG", "dtd/2.1r3/iso-amsa.ent", "dtd/2.1r3/iso-amsb.ent", "dtd/2.1r3/iso-amsc.ent", "dtd/2.1r3/iso-amsn.ent", "dtd/2.1r3/iso-amso.ent", "dtd/2.1r3/iso-amsr.ent", "dtd/2.1r3/iso-box.ent", "dtd/2.1r3/iso-cyr1.ent", "dtd/2.1r3/iso-cyr2.ent", "dtd/2.1r3/iso-dia.ent", "dtd/2.1r3/iso-grk3.ent", "dtd/2.1r3/iso-lat1.ent", "dtd/2.1r3/iso-lat2.ent", "dtd/2.1r3/iso-mfrk.ent", "dtd/2.1r3/iso-mopf.ent", "dtd/2.1r3/iso-mscr.ent", "dtd/2.1r3/iso-num.ent", "dtd/2.1r3/iso-num.old.ent", "dtd/2.1r3/iso-pub.ent", "dtd/2.1r3/iso-tech.ent", "dtd/2.1r3/onix-international.dtd", "dtd/2.1r3/onix-xhtml.elt", "dtd/2.1r3/reference.elt", "dtd/2.1r3/xhtml-special.ent", "dtd/2.1r3/xhtml-symbol.ent", "support/entities.txt", "support/extract.rb", "support/switch-onix-2.1-short-to-reference.xsl", "support/switch-onix-tagnames-1.1.xsl", "support/switch-onix-tagnames-2.0.xsl", "spec/contributor_spec.rb", "spec/header_spec.rb", "spec/imprint_spec.rb", "spec/market_representation_spec.rb", "spec/measure_spec.rb", "spec/media_file_spec.rb", "spec/normaliser_spec.rb", "spec/other_text_spec.rb", "spec/price_spec.rb", "spec/product_identifier_spec.rb", "spec/product_spec.rb", "spec/publisher_spec.rb", "spec/reader_spec.rb", "spec/sales_restriction_spec.rb", "spec/sender_identifier.rb", "spec/stock_spec.rb", "spec/subject_spec.rb", "spec/supply_detail_spec.rb", "spec/title_spec.rb", "spec/website_spec.rb", "spec/writer_spec.rb", "onix.gemspec"]
  s.homepage = %q{http://github.com/yob/onix/tree/master}
  s.rdoc_options = ["--title", "ONIX - Working with the ONIX XML spec", "--line-numbers"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rbook}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A convient mapping between ruby objects and the ONIX XML specification}
  s.test_files = ["spec/contributor_spec.rb", "spec/header_spec.rb", "spec/imprint_spec.rb", "spec/market_representation_spec.rb", "spec/measure_spec.rb", "spec/media_file_spec.rb", "spec/normaliser_spec.rb", "spec/other_text_spec.rb", "spec/price_spec.rb", "spec/product_identifier_spec.rb", "spec/product_spec.rb", "spec/publisher_spec.rb", "spec/reader_spec.rb", "spec/sales_restriction_spec.rb", "spec/sender_identifier.rb", "spec/stock_spec.rb", "spec/subject_spec.rb", "spec/supply_detail_spec.rb", "spec/title_spec.rb", "spec/website_spec.rb", "spec/writer_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<roxml>, [">= 2.5.3.1.br"])
      s.add_runtime_dependency(%q<andand>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4"])
      s.add_runtime_dependency(%q<activesupport>, ["<= 2.9.9"])
    else
      s.add_dependency(%q<roxml>, [">= 2.5.3.1.br"])
      s.add_dependency(%q<andand>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 1.4"])
      s.add_dependency(%q<activesupport>, ["<= 2.9.9"])
    end
  else
    s.add_dependency(%q<roxml>, [">= 2.5.3.1.br"])
    s.add_dependency(%q<andand>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 1.4"])
    s.add_dependency(%q<activesupport>, ["<= 2.9.9"])
  end
end
