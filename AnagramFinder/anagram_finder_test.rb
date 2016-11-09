require 'test/unit'
require '../AnagramFinder/anagram_finder'

class AnagramFinderTest < Test::Unit::TestCase

  def test_recognize_valid_anagram
    assert AnagramFinder.anagram?('sinks', 'skins')
  end

  def test_recognize_invalid_anagram
    assert_false AnagramFinder.anagram?('foo', 'bar')
  end

  def test_should_find_single_anagram_in_word_list
    word_list = %w(sinks foo skins)
    actual = AnagramFinder.find_anagrams(word_list)
    assert_equal([%w(sinks skins)], actual)
  end

  def test_should_find_multiple_anagrams_in_word_list
    word_list = %w(sinks rots foo knits bar skins baz stink sort)
    actual = AnagramFinder.find_anagrams(word_list)
    assert_equal([%w(sinks skins), %w(rots sort), %w(knits stink)], actual)
  end

  def test_find_anagrams_from_text_shuold_input_and_output_text
    word_list = "sinks\nrots\nfoo\nknits\nbar\nskins\nbaz\nstink\nsort"
    actual = AnagramFinder.find_anagrams_from_text(word_list)
    assert_equal("sinks skins\nrots sort\nknits stink", actual)
  end

end