gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/contact'

class ContactTest < Minitest::Test
  attr_reader :contact
  def setup
    @contact = Contact.new({
                            first_name: "bob",
                            last_name: "smith",
                            zipcode: "1234",
                            email: "example@example.com",
                            phone: "123-123-1234",
                            street: "123 apple st.",
                            city: "fairbanks",
                            state: "ak",
                            reg_time: "11/12/08 10:47"
                          })
  end

  def test_it_returns_first_name
    assert_equal "Bob", contact.first_name
  end

  def test_it_returns_last_name
    assert_equal "Smith", contact.last_name
  end

  def test_it_returns_city
    assert_equal "Fairbanks", contact.city
  end

  def test_it_returns_state
    assert_equal "AK", contact.state
  end

  def test_it_can_clean_a_short_zip_code
    assert_equal "01234", contact.zipcode
  end

  def test_it_can_clean_a_nil_zip_code
    assert_equal "00000", contact.clean_zip(nil)
  end

  def test_it_can_clean_a_long_zip_code
    assert_equal "12345", contact.clean_zip("123456")
  end

  def test_it_can_clean_a_good_zip_code
    assert_equal "12345", contact.clean_zip("12345")
  end

  def test_it_can_clean_a_nil_phone_number
    assert_equal "No Phone", contact.clean_phone(nil)
  end

  def test_it_can_clean_a_valid_phone_number
    assert_equal "123-123-1234", contact.clean_phone("123-123-1234")
  end

  def test_it_can_clean_an_invalid_phone_number
    assert_equal "Invalid Phone", contact.clean_phone("123-123-12343324124")
  end

  def test_it_can_clean_a_good_email_address
    assert_equal "example@example.com", contact.clean_email("example@example.com")
  end

  def test_it_can_clean_a_nil_email_address
    assert_equal "No Email", contact.clean_email(nil)
  end

  def test_it_can_clean_an_invalid_email_address
    assert_equal "Invalid Email", contact.clean_email("exampleexample.com")
  end

  def test_it_can_clean_a_nil_street_address
    assert_equal "No Street", contact.clean_street(nil)
  end

  def test_it_can_clean_a_valid_street_address
    assert_equal "123 apple st.", contact.clean_street("123 apple st.")
  end

end
