class FizzBuzz

  def self.print_fizz_up_to(length)
    fizz_array = []

    (1..length).each do |value|
      if (value % 3 == 0 && value % 5 == 0)
        fizz_array << 'FizzBuzz'
      elsif (value % 3 == 0)
        fizz_array << 'Fizz'
      elsif (value % 5 == 0)
        fizz_array << 'Buzz'
      else
        fizz_array << value
      end
    end

    fizz_array.join(', ')
  end

end