require 'test/unit'
require_relative 'time_converter'

class TimeConverterTest < Test::Unit::TestCase

  def test_convert_12h_am_to_24h
    assert_equal('11:30', TimeConverter.to_24h('11:30AM'))
    assert_equal('06:20', TimeConverter.to_24h('06:20AM'))
    assert_equal('08:00', TimeConverter.to_24h('08:00AM'))
  end

  def test_convert_12h_pm_to_24h
    assert_equal('23:30', TimeConverter.to_24h('11:30PM'))
    assert_equal('18:20', TimeConverter.to_24h('06:20PM'))
    assert_equal('20:00', TimeConverter.to_24h('08:00PM'))
  end

  def test_convert_12h_midnight_to_24h
    assert_equal('00:00', TimeConverter.to_24h('12:00AM'))
  end

  def test_convert_12h_noon_to_24h
    assert_equal('12:00', TimeConverter.to_24h('12:00PM'))
  end

end