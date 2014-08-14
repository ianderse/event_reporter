gem 'minitest'
require 'csv'
require 'minitest/autorun'
require_relative '../lib/directory'

class DirectoryTest < Minitest::Test

  def setup
    @directory = Directory.new
  end

  def test_it_can_load_CSV_file
    @directory.load_content("event_attendees.csv")
    assert_equal 5175, @directory.directory.size
  end

  def test_it_can_load_a_different_CSV_file
    @directory.load_content("sample.csv")
    assert_equal 16, @directory.directory.size
  end

  def test_file_given_exists
    assert_equal true, @directory.file_exist?("data/sample.csv")
  end

  def test_file_given_does_not_exist
    refute @directory.file_exist?("notfile.csv")
  end

end
