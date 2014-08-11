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
    @queue.results = @handler.find_by(:first_name, "Allison")
    assert_equal 16, @queue.results.size
  end

  def test_find_by_last_name
    @queue.results = @handler.find_by(:last_name, "Curry")
    assert_equal 1, @queue.results.size
  end

  def test_find_by_reg_date
    @queue.results = @handler.find_by(:regdate, "11/12/08 10:47")
    assert_equal 1, @queue.results.size
  end

  def test_find_by_zip_code
    @queue.results = @handler.find_by(:zipcode, "20010")
    assert_equal 5, @queue.results.size
  end

  def test_find_by_email_address
    @queue.results = @handler.find_by(:email_address, "arannon@jumpstartlab.com")
    assert_equal 1, @queue.results.size
  end

  def test_find_by_home_phone
    @queue.results = @handler.find_by(:homephone, "6154385000")
    assert_equal 1, @queue.results.size
  end

  def test_find_by_street
    @queue.results = @handler.find_by(:street, "3155 19th St NW")
    assert_equal 1, @queue.results.size
  end

  def test_find_by_city
    @queue.results = @handler.find_by(:city, "Washington")
    assert_equal 216, @queue.results.size
  end

  def test_find_by_state
    @queue.results = @handler.find_by(:state, "DC")
    assert_equal 236, @queue.results.size
  end

end
