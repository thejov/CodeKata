# Kata from here: https://www.codewars.com/kata/55983863da40caa2c900004e

class NextBigger

  def self.get_next(number)

    digits = number.digits

    digits.each_index do |i|
      digits_so_far = digits[0..i]

      if digits[i] != digits_so_far.max

        same_beginning = digits[i+1..-1].reverse

        next_biggest_digit = next_biggest_digit_from_list(digits[i], digits_so_far)

        digits_so_far.delete_at( digits_so_far.index( next_biggest_digit ) )
        ending_sorted = digits_so_far.sort

        return (same_beginning + [next_biggest_digit] + ending_sorted).join.to_i
      end

    end

    return -1
  end

  def self.next_biggest_digit_from_list(digit, list)
    list.sort.bsearch { |list_digit| list_digit > digit }
  end

end