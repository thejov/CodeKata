require 'test/unit'
require_relative 'next_bigger'

class NextBiggerTest < Test::Unit::TestCase

  def test_next_bigger_with_one_digit_should_always_return_false
    assert_equal(-1, NextBigger.get_next(9))
    assert_equal(-1, NextBigger.get_next(4))
    assert_equal(-1, NextBigger.get_next(1))
  end

  def test_next_bigger_two_digits
    assert_equal(21, NextBigger.get_next(12))
    assert_equal(-1, NextBigger.get_next(21))
  end

  def test_next_bigger_three_digits
   assert_equal(531, NextBigger.get_next(513))
    assert_equal(213, NextBigger.get_next(132))
   assert_equal(-1, NextBigger.get_next(531))
  end

  def test_next_bigger_n_digits
    assert_equal(2071, NextBigger.get_next(2017))
    assert_equal(2170, NextBigger.get_next(2107))
    assert_equal(12345687, NextBigger.get_next(12345678))
    assert_equal(13245, NextBigger.get_next(12543))
  end

  def test_next_bigger_with_several_same_digits
    assert_equal(12242, NextBigger.get_next(12224))
    assert_equal(2122, NextBigger.get_next(1222))
  end

end