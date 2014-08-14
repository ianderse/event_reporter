gem 'minitest'
require 'csv'
require 'minitest/autorun'
require_relative '../lib/directory'
require_relative '../lib/queue'

class FindTest < Minitest::Test
  def setup
    @directory = Directory.new
    @queue = Queue.new
    @directory.load_content("sample.csv")
  end

  def test_find_by_first_name
    @queue.results = @directory.find_by(:first_name, "allison")
    assert_equal 16, @queue.results.size
  end

  def test_find_by_last_name
    @queue.results = @directory.find_by(:last_name, "nguyen")
    assert_equal 1, @queue.results.size
  end

  def test_find_by_zip_code
    @queue.results = @directory.find_by(:zipcode, "20010")
    assert_equal 1, @queue.results.size
  end

  def test_find_by_home_phone
    @queue.results = @directory.find_by(:homephone, "6154385000")
    assert_equal 1, @queue.results.size
  end

  def test_find_by_street
    @queue.results = @directory.find_by(:street, "3155 19th st nw")
    assert_equal 1, @queue.results.size
  end

  def test_find_by_city
    @queue.results = @directory.find_by(:city, "washington")
    assert_equal 4, @queue.results.size
  end

  def test_find_by_state
    @queue.results = @directory.find_by(:state, "dc")
    assert_equal 4, @queue.results.size
  end

end
