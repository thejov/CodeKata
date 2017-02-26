# Kata from here: http://codekata.com/kata/kata02-karate-chop/
# KarateChop a.k.a. BinarySearch

class KarateChop
  def self.chop(searched_number, array_of_numbers)
    return -1 if array_of_numbers.empty?

    first_index = 0
    last_index = array_of_numbers.size - 1

    while first_index <= last_index
      middle_index = (first_index + last_index) / 2
      middle_value = array_of_numbers[middle_index]

      return middle_index if searched_number == middle_value

      if searched_number < middle_value
        last_index = middle_index - 1
      else
        first_index = middle_index + 1
      end
    end

    array_of_numbers.first == searched_number ? 0 : -1
  end
end
