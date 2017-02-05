require 'test/unit'
require_relative 'figlet'


class FigletTest < Test::Unit::TestCase

  def test_parsing_headerline_for_standard_font
    figlet = Figlet.new
    assert_equal('$', figlet.hardblank, 'Incorrect hardblank character')
    assert_equal(6, figlet.height, 'Incorrect height')
    assert_equal(11, figlet.comment_line_count, 'Incorrect comment line count')
  end

  def test_figlet_a_char
    actual = Figlet.new.write('a').split("\n").map { |line| line.strip }

    expected = File.readlines( test_data_path('a_as_figlet.txt') ).map { |line| line.strip }
    assert_equal(expected, actual)
  end

  def test_figlet_foobar_string
    actual = Figlet.new.write('foobar').split("\n").map { |line| line.strip }

    expected = File.readlines( test_data_path('foobar_as_figlet.txt') ).map { |line| line.strip }
    assert_equal(expected, actual)
  end

  def test_figlet_with_whitespace_in_middle
    actual = Figlet.new.write('foo bar baz').split("\n").map { |line| line.strip }

    expected = File.readlines( test_data_path('figlet_sentence.txt') ).map { |line| line.strip }
    assert_equal(expected, actual)
  end

  def test_roman_font
    actual = Figlet.new('roman').write('Foo Bar 123!').split("\n").map { |line| line.strip }

    expected = File.readlines( test_data_path('figlet_sentence_roman.txt') ).map { |line| line.strip }
    assert_equal(expected, actual)
  end

  def test_non_ascii_chars_should_return_error_message
    actual = Figlet.new.write('foobar and äö')

    expected = 'Text should only contain ASCII characters.'
    assert_equal(expected, actual, 'Should not work with non-ascii characters')
  end

  private

  def test_data_path(filename)
    File.dirname(__FILE__) + '/test_data/' + filename
  end

end