# roap_vd
roap data validation extension

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

가독성을 위해 하나의 파라미터를 여러줄에 걸쳐 작성할 수 있습니다.

```rb
class Foo
  # @restrictions
  #   id       => length(0..32)
  #               nullable
  #               typeof(String)
  #   password => length(32)
  #               nullable
  #               within(["a", "b", "c"])
  def foo id
  end
end
```

* typeof(Class)
* length(Range)
* length(Fixnum)
* regex(Regex)
* nullable
* within(Array)
* within(Range)
* equal(Object)
