require_relative '../lib/require_helper'
require 'terminal-table'
require 'csv'
require 'colorize'

class Queue

  attr_accessor :results

  def initialize
    @results = {}
  end

  def clear
    @results = Hash.new
  end

  def sort_queue(param)
    results.sort_by! { |contact| contact.send(param.to_sym) }
  end

  def create_table
    rows = results.map do |result|
      [result.last_name.cyan, result.first_name.cyan, result.email.cyan, result.zipcode.cyan, result.city.cyan, result.state.cyan, result.street.cyan, result.homephone.cyan]
    end
    #rows.unshift(["LAST NAME".blue.bold, "FIRST NAME".blue.bold, "EMAIL".blue.bold, "ZIPCODE".blue.bold, "CITY".blue.bold, "STATE".blue.bold, "ADDRESS".blue.bold, "PHONE".blue.bold])
    table = Terminal::Table.new :headings => ["LAST NAME".blue.bold, "FIRST NAME".blue.bold, "EMAIL".blue.bold, "ZIPCODE".blue.bold, "CITY".blue.bold, "STATE".blue.bold, "ADDRESS".blue.bold, "PHONE".blue.bold], :rows => rows
  end

  def save(save_file)
    i = 1
    Dir.mkdir("data") unless Dir.exists?("data")

    filename = "data/#{save_file}"

    File.open(filename,'w') do |file|
      file.puts " ,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode"
      results.map do |contact|
        file.puts "#{i},#{contact.first_name},#{contact.last_name},#{contact.email},#{contact.homephone},\"#{contact.street}\",#{contact.city},#{contact.state},#{contact.zipcode}\n"
        i += 1
      end
    end

  end

end
