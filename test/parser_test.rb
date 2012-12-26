require File.expand_path('../test_helper', __FILE__)

class BasicParserTest < Riml::TestCase

  test "parsing basic method" do
    code = <<-Viml
    def a_method(a, b)
      true
    end
    Viml
    expected = Nodes.new([
      DefNode.new('!', nil, "a_method", ['a', 'b'], nil,
        Nodes.new([TrueNode.new])
      )
    ])
    assert_equal expected, parse(code)
  end

  test "parsing method with if block" do
    code = <<Viml
def b:another_method(a, b)
  if hello()
    true
  else
    false
  end
end
Viml
    expected = Nodes.new([
      DefNode.new('!', 'b:', "another_method", ['a', 'b'], nil, Nodes.new(
        [IfNode.new(CallNode.new(nil, "hello", []),
                      Nodes.new([TrueNode.new,
                                 ElseNode.new(
                                 Nodes.new([FalseNode.new])
                                )])
                   )]
      ))
    ])
    assert_equal expected, parse(code)
  end

  test "parsing a ruby-like 'if this then that end' expression" do
    code = <<-Riml
    if b() then a = 2 end
    Riml
    expected = Nodes.new([
      IfNode.new(
        CallNode.new(nil, 'b', []),
        Nodes.new(
          [AssignNode.new("=", GetVariableNode.new(nil, "a"), NumberNode.new("2"))]
        )
      )
    ])
    assert_equal expected, parse(code)
  end

  test "parsing an unless expression" do
    riml = <<Riml
unless shy()
  echo("hi");
end
Riml
    expected = Nodes.new([
      UnlessNode.new(
        CallNode.new(nil, 'shy', []),
        Nodes.new(
          [ CallNode.new(nil, 'echo', [StringNode.new('hi', :d)]) ]
        )
      )
    ])

    assert_equal expected, parse(riml)
  end

  test "scope modifier literal" do
    riml = <<Riml
if s:var
  return s:
else
  return g:
end
Riml

    expected =
      Nodes.new([
        IfNode.new(GetVariableNode.new("s:","var"), Nodes.new([
          ReturnNode.new(ScopeModifierLiteralNode.new("s:")),
        ElseNode.new(Nodes.new([
          ReturnNode.new(ScopeModifierLiteralNode.new("g:"))
        ]))
        ])
      )])
    assert_equal expected, parse(riml)
  end

  test "dictionary key with bracket assign" do
    riml = <<Riml
  function! urules.add(name, urules)
    call add(self.names, a:name)
    let self.table[a:name] = a:urules
  endfunction
Riml

    expected = Nodes.new([
        DefNode.new("!", nil, "urules.add", ["name", "urules"], nil, Nodes.new([
          ExplicitCallNode.new(nil, "add", [DictGetDotNode.new(
            GetVariableNode.new(nil, "self"), ["names"]), GetVariableNode.new("a:", "name")]),
          AssignNode.new("=", ListOrDictGetNode.new(
            DictGetDotNode.new(GetVariableNode.new(nil, "self"), ["table"]), [GetVariableNode.new("a:", "name")]), GetVariableNode.new("a:", "urules"))]))])
    assert_equal expected, parse(riml)
  end

  test "ERROR: curly-brace names don't parse unless prefix or suffix parts are present" do
    riml = <<Riml
let {color} = 138
Riml

    riml2 = <<Riml
let {bright{color}} = 138
Riml

    [riml, riml2].each do |source|
      assert_raises Riml::ParseError do
        parse(source)
      end
    end
  end

end
