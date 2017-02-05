require 'test/unit'
require_relative 'fibonacci_sequence_solver'

class FibonacciSequenceSolverTest < Test::Unit::TestCase

  def test_get_sequence_of_10
    actual_sequence = FibonacciSequenceSolver.get_sequence(10)
    expected_sequence = '0, 1, 1, 2, 3, 5, 8, 13, 21, 34'
    assert_equal expected_sequence, actual_sequence
  end

  def test_get_sequence_of_5
    actual_sequence = FibonacciSequenceSolver.get_sequence(5)
    expected_sequence = '0, 1, 1, 2, 3'
    assert_equal expected_sequence, actual_sequence
  end

  def test_get_sequence_of_3
    actual_sequence = FibonacciSequenceSolver.get_sequence(3)
    expected_sequence = '0, 1, 1'
    assert_equal expected_sequence, actual_sequence
  end

  def test_get_sequence_of_2
    actual_sequence = FibonacciSequenceSolver.get_sequence(2)
    expected_sequence = '0, 1'
    assert_equal expected_sequence, actual_sequence
  end

  def test_get_sequence_of_1
    actual_sequence = FibonacciSequenceSolver.get_sequence(1)
    expected_sequence = '0'
    assert_equal expected_sequence, actual_sequence
  end

end