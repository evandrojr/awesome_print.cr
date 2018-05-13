macro define_method(name, content, v2, v3)
  def {{name.id(content, v2, v3)}}
    {{content}}
  end
end


# define_dummy_methods foo, bar, baz

define_method string, "aasasa", 2, 3


# foo
bar 2
# baz
