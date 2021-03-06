gem 'minitest'
require 'minitest/unit'

$VERBOSE = 1
require File.expand_path('../../lib/riml', __FILE__)

module Riml
  class TestCase < MiniTest::Unit::TestCase

    # taken from activesupport/testing/declarative
    def self.test(name, &block)
      test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym
      defined = instance_method(test_name) rescue false
      raise "#{test_name} is already defined in #{self}" if defined
      if block_given?
        define_method(test_name, &block)
      else
        define_method(test_name) do
          flunk "No implementation provided for #{name}"
        end
      end
    end

    # `capture_subprocess_io` is available in new versions of MiniTest
    MiniTest::Assertions.class_eval do
      def capture_subprocess_io
        require 'tempfile'

        captured_stdout, captured_stderr = Tempfile.new("out"), Tempfile.new("err")

        orig_stdout, orig_stderr = $stdout.dup, $stderr.dup
        $stdout.reopen captured_stdout
        $stderr.reopen captured_stderr

        begin
          yield

          $stdout.rewind
          $stderr.rewind

          [captured_stdout.read, captured_stderr.read]
        ensure
          captured_stdout.unlink
          captured_stderr.unlink
          $stdout.reopen orig_stdout
          $stderr.reopen orig_stderr
        end
      end unless instance_methods.include?(:capture_subprocess_io)
    end

    alias assert_equal_orig assert_equal

    def assert_equal_debug(expected, actual)
      if expected == actual
        return assert_equal_orig(expected, actual)
      end

      STDERR.puts <<EOS
\nexpected:

#{expected.to_s.each_line.to_a.join}

actual:

#{actual.to_s.each_line.to_a.join}
EOS
      assert_equal_orig(expected, actual)
    end

    if ENV['DEBUG']
      alias assert_equal assert_equal_debug
    end

    def assert_riml_warning(expected_warning = /Warning:/i)
      _, err = capture_subprocess_io do
        yield
        Riml.send(:flush_warnings)
      end
      warnings = err.each_line.to_a
      if Regexp === expected_warning
        assert warnings.any? { |w| expected_warning =~ w }
      elsif expected_warning.respond_to?(:to_s)
        assert warnings.any? { |w| expected_warning.to_s == w }
      else
        raise ArgumentError
      end
    end

    def lex(code)
      Riml.lex(code)
    end

    def parse(input, ast_rewriter = AST_Rewriter.new)
      Riml.parse(input, ast_rewriter)
    end

    def compile(input)
      Riml.compile(input)
    end

    %w(source_path include_path).each do |path|
      define_method "with_riml_#{path}" do |*new_paths, &block|
        begin
          old_path = Riml.send(path)
          Riml.send("#{path}=", new_paths)
          block.call
        ensure
          Riml.send("#{path}=", old_path)
        end
      end
    end

    def with_file_cleanup(*file_names)
      yield
    ensure
      file_names.each do |name|
        Riml.source_path.each do |path|
          full_path = File.join(path, name)
          File.delete(full_path) if File.exists?(full_path)
        end
      end
    end
  end
end

all_files_before = Dir.glob('*/**')

MiniTest::Unit.after_tests do
  all_files_after = Dir.glob('*/**')
  if all_files_after != all_files_before
    STDERR.puts "WARNING: test suite added/removed file(s). Diff: " \
      "#{all_files_after.to_set.difference(all_files_before.to_set).to_a}"
  end
end

MiniTest::Unit.autorun
