gem 'minitest'
require 'csv'
require 'minitest/autorun'
require_relative '../lib/queue'
require_relative '../lib/directory'

class QueueTest < Minitest::Test

  def setup
    @directory = Directory.new
    @queue = Queue.new
    @directory.load_content("sample.csv")
  end

  def test_queue_size_is_zero_when_empty
    assert_equal 0, @queue.results.size
  end

  def test_queue_size_is_62_when_searching_first_name_john
    @queue.results = @directory.find_by(:first_name, "allison")
    assert_equal 16, @queue.results.size
  end

  def test_when_queue_is_cleared_it_is_empty
    @queue.results = @directory.find_by(:first_name, "allison")
    @queue.clear
    assert_equal 0, @queue.results.size
  end

end
