require 'test/unit'
require_relative 'prime_number'

class PrimeNumberTest < Test::Unit::TestCase

  def test_should_recognize_prime_number
    assert(PrimeNumber.prime?(1), 'Should recognize 1 as prime.')
    assert(PrimeNumber.prime?(2),'Should recognize 2 as prime.')
    assert(PrimeNumber.prime?(3),'Should recognize 3 as prime.')
    assert(PrimeNumber.prime?(7),'Should recognize 7 as prime.')
    assert(PrimeNumber.prime?(11),'Should recognize 11 as prime.')
    assert(PrimeNumber.prime?(31),'Should recognize 31 as prime.')
    assert(PrimeNumber.prime?(997),'Should recognize 997 as prime.')
  end

  def test_should_recognize_non_prime_number
    assert_false(PrimeNumber.prime?(4),'Should recognize 4 as non prime.')
    assert_false(PrimeNumber.prime?(9),'Should recognize 9 as non prime.')
    assert_false(PrimeNumber.prime?(50),'Should recognize 50 as non prime.')
    assert_false(PrimeNumber.prime?(788),'Should recognize 788 as non prime.')
  end

end