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

  def test_it_can_clean_a_phone_number
    skip
  end

  def test_it_can_clean_an_email_address
    skip
  end

  def test_it_can_clean_a_street_address
    skip
  end

end
