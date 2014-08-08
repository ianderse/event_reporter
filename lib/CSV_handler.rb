require 'csv'

class CSVHandler

  def initialize

  end

  def load_content(file_name="event_attendees.csv")
    if file_exist?("data/" +"#{file_name}")
      CSV.open "data/" + "#{file_name}", headers: true
    else
      "File does not exist."
    end
  end

  def print_content(content)
    puts content
  end

  def file_exist?(file_name)
    File.exist? "#{file_name}"
  end

end

if __FILE__ == $0
  handler = CSVHandler.new
  content = handler.load_content
  handler.print_content(content)
end
