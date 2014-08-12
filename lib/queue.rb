require_relative '../lib/require_helper'
require 'terminal-table'

class Queue

  attr_accessor :results

  def initialize
    @results = {}
  end

  def clear
    @results = Hash.new
  end

  def create_table
    rows = []
    rows << ["LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "ADDRESS", "PHONE"]
    results.each do |result|
      rows << [result.last_name, result.first_name]
    end

    table = Terminal::Table.new :rows => rows
  end

end
