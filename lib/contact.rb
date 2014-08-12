require 'ValidateEmail'
require 'phone'

class Contact
  attr_reader :first_name, :zipcode, :last_name, :city, :state, :street, :homephone, :email

  def initialize(data)
    @first_name = clean_name(data[:first_name])
    @zipcode = clean_zip(data[:zipcode])
    @last_name = clean_name(data[:last_name])
    @city = clean_city(data[:city])
    @state = clean_state(data[:state])
    @street = clean_street(data[:street])
    @email = clean_email(data[:email_address])
    @homephone = clean_phone(data[:homephone])
  end

  def clean_phone(phone)
    if phone.nil?
      "No Phone"
    elsif Phoner::Phone.valid?("+1"+phone)
      phone
    else
      "Invalid Phone"
    end
  end

  def clean_name(name)
    name.capitalize
  end

  def clean_email(email)
    if email.nil?
      "No Email"
    elsif ValidateEmail.validate(email)
      email
    else
      "Invalid Email"
    end
  end

  def clean_street(street)
    if street.nil?
      "No Street"
    else
      street
    end
  end

  def clean_zip(zipcode)
    case
    when zipcode.nil?
      "00000"
    when zipcode.length == 5
      zipcode
    when zipcode.length < 5
      zipcode.rjust(5, "0")
    when zipcode.length > 5
      zipcode[0..4]
    end
  end

  def clean_city(city)
    if city.nil?
      "No City"
    else
      city.capitalize
    end
  end

  def clean_state(state)
    if state.nil?
      "--"
    else
      state.upcase
    end
  end

end
