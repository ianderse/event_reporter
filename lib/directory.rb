require_relative './require_helper'
require_relative './find'
require 'csv'

class Directory

  attr_accessor :directory

  include Find

  def initialize

  end

  def load_content(file_name)
    csv_data = CSV.open "data/" + "#{file_name}", headers: true, header_converters: :symbol

    @directory = csv_data.map do |row|
                    Contact.new(row)
                end
  end

  def file_exist?(file_name)
    File.exist? "#{file_name}"
  end

end

if __FILE__ == $0

  directory = Directory.new
  queue = Queue.new
  directory.load_content
  queue.results = directory.find_by(:first_name, "allison")
  puts queue.results.size
end
