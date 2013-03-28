require File.expand_path('../environment', __FILE__)
require 'nodes'
require 'lexer'
require 'parser'
require 'compiler'

module Riml
  # lex code into tokens
  def self.lex(code)
    Lexer.new(code).tokenize
  end

  # parse code (or tokens) into nodes
  def self.parse(input, ast_rewriter = AST_Rewriter.new)
    unless input.is_a?(Array) || input.is_a?(String)
      raise ArgumentError, "input must be tokens or code, is #{input.class}"
    end
    Parser.new.parse(input, ast_rewriter)
  end

  # compile nodes (or tokens or code or file) into output code
  def self.compile(input, parser = Parser.new, compiler = Compiler.new, &block)
    # setup compiler
    compiler.parser = parser
    block.call(compiler) if block

    if compiler.link_files.any?
      resolve_links(compiler)
    end

    if input.is_a?(Nodes)
      nodes = input
    elsif input.is_a?(String) || input.is_a?(Array)
      nodes = parser.parse(input)
    elsif input.is_a?(File)
      source = input.read
      nodes = parser.parse(source)
    else
      raise ArgumentError, "input must be nodes, tokens, code or file, is #{input.class}"
    end

    output = compiler.compile(nodes)
    return output unless input.is_a?(File)
    write_file(output, input.path)
  ensure
    input.close if input.is_a?(File)
    process_compile_queue!(compiler)
  end

  # expects `file_names` to be readable files
  def self.compile_files(*filenames, &block)
    if filenames.size > 1
      threaded_compile_files(*filenames)
    elsif filenames.size == 1
      fname = filenames.first
      f = File.open(fname)
      # `compile` will close file handle
      compile(f, Parser.new, Compiler.new, &block)
    else
      raise ArgumentError, "need filenames to compile"
    end
  end

  # checks syntax of `input` (lexes + parses) without going through ast rewriting or compilation
  def self.check_syntax(input)
    raise ArgumentError.new(input) unless input.is_a?(String)
    parse(input, false)
    true
  end

  def self.check_syntax_files(*filenames)
    filenames.each do |fname|
      File.open(fname) {|f| check_syntax(f.read)}
    end
    true
  end

  def self.source_path
    @source_path ||= Dir.getwd
  end
  def self.source_path=(path)
    @source_path = path
  end

  private

  def self.resolve_links(compiler)
    compiler.linking = true
    compiler.link_files.each do |fname|
      source = File.read(fname)
      # build ast
      compiler.compile(compiler.parser.parse(source))
      # linking 'riml_include'd files that appear in the source code first
      while included_fname = compiler.link_include_files.shift
        source = File.read(included_fname)
        compiler.compile(compiler.parser.parse(source))
      end
      # linking 'riml_sourced'd files that appear in the source code first
      while sourced_fname = compiler.compile_queue.shift
        source = File.read(sourced_fname)
        compiler.compile(compiler.parser.parse(source))
      end
    end
  ensure
    compiler.linking = false
  end

  def self.threaded_compile_files(*filenames)
    threads = []
    filenames.each do |fname|
      threads << Thread.new do
        f = File.open(fname)
        compile(f)
      end
    end
    threads.each {|t| t.join}
  end

  # This is for when another file is sourced within a file we're compiling.
  def self.process_compile_queue!(compiler)
    while filename = compiler.compile_queue.shift
      unless compiler.sourced_files_compiled.include?(filename)
        compiler.sourced_files_compiled << filename
        compile(File.open(File.join(Riml.source_path, filename)), compiler.parser, compiler)
      end
    end
  end

  FILE_HEADER = File.read(File.expand_path("../header.vim", __FILE__)) % VERSION.join('.')
  INCLUDE_COMMENT_FMT = File.read(File.expand_path("../included.vim", __FILE__))

  def self.write_file(output, fname)
    file_basename = File.basename(fname)
    unless File.extname(file_basename).empty?
      file_basename = file_basename.split(".").tap {|parts| parts.pop}.join(".")
    end
    File.open("#{file_basename}.vim", 'w') do |f|
      f.write FILE_HEADER + output
    end
  end

end
