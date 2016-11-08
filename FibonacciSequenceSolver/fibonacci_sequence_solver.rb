
class FibonacciSequenceSolver
  def self.get_sequence(length)
    sequence = []
    sequence << 0
    sequence << 1

    while (sequence.length < length)
      sequence << sequence.reverse.take(2).reduce(:+)
    end

    sequence.take(length).join(', ')
  end
end