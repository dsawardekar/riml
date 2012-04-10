module Riml
  class Lexer
    KEYWORDS = %w(def end if then else elsif unless true false nil return)

    def tokenize(code)
      code.chomp!
      i = 0
      tokens = []
      current_indent = 0
      indent_pending = false
      dedent_pending = false
      expecting_identifier = false
      one_line_conditional_END_pending = false

      while i < code.size
        chunk = code[i..-1]

        if scope_modifier = chunk[/\A(s|b|w|g|v|a):/]
          raise TypeError, "expected identifier after scope modifier" if expecting_identifier
          tokens << [:SCOPE_MODIFIER, scope_modifier]
          expecting_identifier = true
          i += 2
        elsif identifier = chunk[/\A[a-zA-Z_]\w*/]
          # keyword identifiers
          if KEYWORDS.include?(identifier)
            tokens << [identifier.upcase.intern, identifier]
            case identifier
            when "def"
              current_indent += 2
              indent_pending = true
            when "if", "unless"
              if one_line_conditional?(chunk)
                one_line_conditional_END_pending = true
              else
                current_indent += 2
                indent_pending = true
              end
            when "end"
              unless one_line_conditional_END_pending
                current_indent -= 2
                dedent_pending = true
              end
            end
          # method and variable names
          else
            tokens << [:IDENTIFIER, identifier ]
          end
          expecting_identifier = false
          i += identifier.size
        elsif expecting_identifier
          raise TypeError, "expected identifier after scope modifier"
        elsif constant = chunk[/\A[A-Z]\w*/]
          tokens << [:CONSTANT, constant]
          i += constant.size
        elsif number = chunk[/\A[0-9]+/]
          tokens << [:NUMBER, number.to_i]
          i += number.size
        elsif interpolation = chunk[/\A"(.*?)(\#{(.*?)})(.*?)"/]
          # "#{hey} guys" = hey . " guys"
          if !$1.empty?
            tokens << [:STRING, $1]
            tokens << ['.', '.']
          end
          tokens << [:IDENTIFIER, $3]
          if !$4.empty?
            tokens << ['.', '.']
            tokens << [ :STRING, " #{$4[1..-1]}" ]
          end
          #s = interpolation.gsub(%r{"}, "'")
          p "Interpolated string: #{s}" if debug?
          i += interpolation.size
        elsif string = chunk[/\A("|')(.*?)("|')/, 2]
          tokens << [:STRING, string]
          i += string.size + 2
        elsif newlines = chunk[/\A(\n+)/, 1]
          # just push 1 newline
          tokens << [:NEWLINE, "\n"]

          # pending indents/dedents
          if one_line_conditional_END_pending
            one_line_conditional_END_pending = false
          elsif indent_pending
            tokens << [:INDENT, current_indent]
            indent_pending = false
          elsif dedent_pending
            tokens << [:DEDENT, current_indent]
            dedent_pending = false
          end

          i += newlines.size
        # operators of more than 1 char
        elsif operator = chunk[%r{\A(\|\||&&|==|!=|<=|>=)}, 1]
          tokens << [operator, operator]
          i += operator.size
        elsif whitespaces = chunk[/\A +/]
          i += whitespaces.size
        elsif one_line_comment = chunk[/\A\s*#.*$/]
          i += one_line_comment.size
        # operators and tokens of single chars ( ) , . [ ] ! + - = < >
        else
          value = chunk[0, 1]
          tokens << [value, value]
          i += 1
        end
      end
      raise "Missing #{current_indent / 2} END identifier(s), " unless current_indent.zero?

      tokens
    end

    private
    def one_line_conditional?(chunk)
      res = chunk[/^(if|unless).*?(else)?.*?end$/]
    end
  end
end
