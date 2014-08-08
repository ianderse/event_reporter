gem 'minitest'
require 'csv'
require 'minitest/autorun'
require_relative '../lib/CSV_handler'
require_relative '../lib/queue'

class FindTest < Minitest::Test
  def setup
    @handler = CSVHandler.new
    @queue = Queue.new
    @content = @handler.load_content
  end

  def test_find_by_first_name
    @queue.results = @handler.find_by_first_name("Allison")
    assert_equal 16, @queue.results.size
  end

end
