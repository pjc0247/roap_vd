module Roap
  module ValidationExtension
    class Validator
      def length arg, value
        arg === value.length
      end
      def typeof arg, value
        value.class == arg
      end
    end
  end
end
