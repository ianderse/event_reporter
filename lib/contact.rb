class Contact
  attr_reader :first_name, :zipcode, :last_name, :city, :state

  def initialize(data)
    @first_name = clean_name(data[:first_name])
    @zipcode = clean_zip(data[:zipcode])
    @last_name = clean_name(data[:last_name])
    @city = clean_city(data[:city])
    @state = clean_state(data[:state])
  end

  def clean_name(name)
    name.capitalize
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
      "----"
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
