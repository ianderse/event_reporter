gem 'minitest'
require 'csv'
require 'minitest/autorun'
require_relative '../lib/queue'

class QueueTest < Minitest::Test

  def setup
    @queue = Queue.new
  end

  def test_queue_size_is_zero_when_empty
    assert_equal 0, @queue.results.size
  end

  def test_find_by_first_name
    @queue.results[:first_name] = 'Alice'
    assert_equal "Alice", @queue.find_by_first_name("Alice")
  end

  def test_find_multiple_first_names
    @queue.results[:first_name] = 'Alice'
    @queue.results[:first_name] += 'Alice'
    puts @queue.results[:first_name]
  end

end
