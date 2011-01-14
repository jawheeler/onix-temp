module ONIX
  # methods we want to be available on all our ROXML classes
  module Common

    # After an input string has been marshalled into an object,
    # ROXML will automatically call this method.
    #
    # LibXML (and therefore ROXML) appears to forget the encoding
    # of the input data, a damn shame considering the Ruby 1.9 encoding
    # support can be vey useful.
    #
    # Since we only ever pass our ROXML objects strings we know are utf-8
    # encoded, it should be safe enough to force every string attribute
    # back once the marshalling is done.
    #
    def after_parse
      self.class.roxml_attrs.each do |attr|
        var = instance_variable_get("@#{attr.variable_name}")
        if var && var.respond_to?(:force_encoding)
          var.force_encoding("utf-8")
        end
      end
    end    
    
    def self.included(base)
      base.class_eval do
        def self.xml_accessor(*args)
          super(*args)

          if args[0].to_s =~ /^short_/
            long = args[0].to_s.match(/^short_(.*)/)[1]
            class_eval("def #{args[0]}; self.#{long}; end")
            class_eval("def #{args[0]}=(a); self.#{long}=a if !a.nil? && (a.class != Array || !a.empty?); end")
          end
        end
        
        def self.xml_reader(*args)
          super(*args)

          if args[0].to_s =~ /^short_/
            long = args[0].to_s.match(/^short_(.*)/)[1]
            class_eval("def #{args[0]}; self.#{long}; end")
          end
        end
        
      end
    end  
    
    
  end  
end

