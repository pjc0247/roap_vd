```rb
module Roap
  module ValidationExtension
    class Validator
      
      def is arg, value
        arg == value
      end
    end
  end
end
```
```rb
class Foo
  # @restrictions
  #    a => is(4)
  def bar a
    puts "bar #{a}"
  end
  
  include Roap::ValidationExtension
end
```
```rb
f = Foo.new
f.bar 4
f.bar 3 # error
```
