
class PrimeNumber

  def self.prime?(number)
    divisor = number - 1

    while (divisor > 1)
      if ( number % divisor == 0 )
        return false
      end

      divisor = divisor - 1
    end

    return true
  end

end