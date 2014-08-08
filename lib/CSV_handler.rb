require 'csv'
require_relative 'find'

class CSVHandler

  attr_accessor :contents

  include Find

  def initialize
    @contents = {}
  end

  def load_content(file_name="event_attendees.csv")
    if file_exist?("data/" +"#{file_name}")
      @contents = CSV.open "data/" + "#{file_name}", headers: true, header_converters: :symbol
    else
      "File does not exist."
    end
  end

  def print_content(content)
    puts contents
  end

  def file_exist?(file_name)
    File.exist? "#{file_name}"
  end

end

if __FILE__ == $0
  require_relative 'queue'
  handler = CSVHandler.new
  queue = Queue.new
  content = handler.load_content
  queue.results = handler.find_by_first_name("Allison")
  puts queue.results.size
end
