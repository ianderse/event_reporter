gem 'minitest'
require 'csv'
require 'minitest/autorun'
require_relative '../lib/queue'
require_relative '../lib/CSV_handler'

class QueueTest < Minitest::Test

  def setup
    @handler = CSVHandler.new
    @queue = Queue.new
    @handler.load_content
  end

  def test_queue_size_is_zero_when_empty
    assert_equal 0, @queue.results.size
  end

  def test_queue_size_is_62_when_searching_first_name_john
    @queue.results = @handler.find_by(:first_name, "John")
    assert_equal 62, @queue.results.size
  end

  def test_when_queue_is_cleared_it_is_empty
    @queue.results = @handler.find_by(:first_name, "John")
    @queue.clear
    assert_equal 0, @queue.results.size
  end

  def test_it_can_print_the_queue
    
  end

end
