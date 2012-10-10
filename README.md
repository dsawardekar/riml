Riml, a relaxed version of Vimscript
====================================

Riml aims to be a superset of VimL that includes some nice features that I
enjoy in other scripting languages, including classes, string interpolation,
heredocs, default case-sensitive string comparison and other things most
programmers take for granted. Also, Riml takes some liberties and provides
some syntactic sugar for lots of VimL constructs. To see how Riml constructs
are compiled into VimL, just take a look in this README. The left side is Riml,
and the right side is the equivalent VimL after compilation.

Variables
---------

    count = 1                     let s:count = 1
    while count < 5               while s:count < 5
      source other.vim              source other.vim
      count += 1                    let s:count += 1
    end                           endwhile

If you don't specify a scope modifier, it's script local by default in the
global namespace. Within a function, variables without scope modifiers are plain
old local variables.

###globally

    a = 3                         let s:a = 3

###locally

    a = 3                         let a = 3

###Freeing memory

    a = nil                       unlet! a

###Checking for existence

    unless s:callcount?                    if !exists("s:callcount")
      callcount = 0                         let s:callcount = 0
    end                                    endif
    callcount += 1                         let s:callcount += 1
    puts "called #{callcount} times"       echo "called " . s:callcount . " times"

Comparisons
-----------

    a = "hi" == "hi"                      if ("hi" ==# "hi")
                                            let s:a = 1
                                          else
                                            let s:a = 0
                                          endif

Heredocs
--------

    msg = <<EOS                           let s:msg = "a vim heredoc!\n"
    a vim heredoc!
    EOS

Classes
-------

###Riml example 1

    class MyClass
      def initialize(arg1, arg2, *args)
      end

      defm getData
        return self.data
      end

      defm getOtherData
        return self.otherData
      end
    end

###Viml example 1


    function! g:MyClassConstructor(arg1, arg2, ...)
      let myClassObj = {}
      function! myClassObj.getData() dict
        return self.data
      endfunction
      function! myClassObj.getOtherData() dict
        return self.otherData
      endfunction
      return myClassObj
    endfunction

###Riml example 2

    class Translation
      def initialize(input)
        self.input = input
      end
    end

    class FrenchToEnglishTranslation < Translation
      defm translate
        if (self.input == "Bonjour!")
          echo "Hello!"
        else
          echo "Sorry, I don't know that word."
        end
      end
    end

    translation = new FrenchToEnglishTranslation("Bonjour!")
    translation.translate()

###VimL example 2

    function! g:TranslationConstructor(input)
      let translationObj = {}
      let translationObj.input = a:input
      return translationObj
    endfunction

    function! g:FrenchToEnglishTranslationConstructor(input)
      let frenchToEnglishTranslationObj = {}
      let translationObj = g:TranslationConstructor(a:input)
      call extend(frenchToEnglishTranslationObj, translationObj)
      function! frenchToEnglishTranslationObj.translate() dict
        if (self.input ==# "Bonjour!")
          echo "Hello!"
        else
          echo "Sorry, I don't know that word."
        endif
      endfunction
      return frenchToEnglishTranslationObj
    endfunction

    let s:translation = g:FrenchToEnglishTranslationConstructor("Bonjour!")
    call s:translation.translate()

Hacking
-------

Make sure to generate the parser before running tests or developing on Riml.
Also, make sure to regenerate the parser after modifiying the grammar file.

1. `bundle install`
2. Go to the lib directory and enter `racc -o parser.rb grammar.y`
