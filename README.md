# roap_vd
roap validation extension (draft)

```rb
class Foo
  # @restrictions
  #   id       => length(0..32), regex([a-zA-Z0-9]+)
  #   password => length(32)
  def login id, password
    # ....
  end
end
```
