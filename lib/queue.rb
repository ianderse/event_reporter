require_relative '../lib/require_helper'

class Queue

  attr_accessor :results

  def initialize
    @results = {}
  end

  def clear
    @results = Hash.new
  end

end
