gem 'minitest'
require 'csv'
require 'minitest/autorun'
require_relative '../lib/CSV_handler'

class CSVHandlerTest < Minitest::Test

  def setup
    @handler = CSVHandler.new
  end

  def test_it_can_load_CSV_file
    content = @handler.load_content
    assert_equal true, content.is_a?(CSV)
  end

  def test_it_can_load_a_different_CSV_file
    content = @handler.load_content("sample_test.csv")
    assert_equal true, content.is_a?(CSV)
  end

  def test_file_given_exists
    assert_equal true, @handler.file_exist?("data/sample_test.csv")
  end

  def test_file_given_does_not_exist
    refute @handler.file_exist?("notfile.csv")
  end

  def test_entire_load_process_works_for_existent_file
    content = @handler.load_content
    assert_equal true, content.is_a?(CSV)
  end

  def test_entire_load_process_does_not_work_for_nonexistent_file
    assert_equal "File does not exist.", @handler.load_content("nonexistentfile.csv")
  end

  def test_it_can_print_content
    skip
    content = @handler.load_content
    @handler.print_content(content)
    assert_equal " ", @handler.print_content(content)
  end

end
