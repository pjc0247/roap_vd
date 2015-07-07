module Roap
  module ValidationExtension
    extend Roap::AttributeBase
    
    def get_restrictions code
      @rs = {}
     
      def method_missing name, *args
        @rs[name] = args[0]
      end
      
      instance_eval code

      @rs
    end 
    def valid? key, rs, value
      vd = Validator.new

      rs.each do |name, arg|
        if vd.methods.include? name and
          not vd.__send__ name.to_sym, arg, value
          
          raise ArgumentError, "'#{key}' on '#{name}'"  
        end
      end
    end

    #runtime
    on /@restrictions()/ do |_super, md, *args|
      mds = __restrictions__.scan(
        /\s+(.*)\s+=>\s+(.*\n.*)/)

      mds.each do |key, value|
        rs = get_restrictions value

        idx = _super.pure.parameters.index [:opt, key.to_sym]
        if idx
          valid? key, rs, args[idx]
        end
      end
    end
  end
end
