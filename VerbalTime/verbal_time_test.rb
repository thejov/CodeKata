require 'test/unit'
require_relative 'verbal_time'

class VerbalTimeTest < Test::Unit::TestCase

  def test_even_hours
    verbal_clock = VerbalTime.new

    assert_equal("It is twelve o'clock.", verbal_clock.verbal_time('12:00'))
    assert_equal("It is three o'clock.", verbal_clock.verbal_time('03:00'))
    assert_equal("It is ten o'clock.", verbal_clock.verbal_time('10:00'))
  end

  def test_half_past_times
    verbal_clock = VerbalTime.new

    assert_equal('It is half past eleven.', verbal_clock.verbal_time('11:30'))
    assert_equal('It is half past two.', verbal_clock.verbal_time('02:30'))
  end

  def test_n_past_times
    verbal_clock = VerbalTime.new

    assert_equal('It is quarter past six.', verbal_clock.verbal_time('06:15'))
    assert_equal('It is five past two.', verbal_clock.verbal_time('02:05'))
    assert_equal('It is twenty past eleven.', verbal_clock.verbal_time('11:20'))
  end

  def test_n_to_times
    verbal_clock = VerbalTime.new

    assert_equal('It is quarter to nine.', verbal_clock.verbal_time('08:45'))
    assert_equal('It is ten to two.', verbal_clock.verbal_time('01:50'))
    assert_equal('It is twenty-five to one.', verbal_clock.verbal_time('12:35'))
  end

  def test_minutes_should_be_rounded_to_5_min_accuracy
    verbal_clock = VerbalTime.new

    assert_equal('It is quarter to nine.', verbal_clock.verbal_time('08:47'))
    assert_equal('It is half past ten.', verbal_clock.verbal_time('10:28'))
    assert_equal("It is three o'clock.", verbal_clock.verbal_time('03:01'))
    assert_equal("It is one o'clock.", verbal_clock.verbal_time('12:59'))
  end

end