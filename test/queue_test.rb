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



end
