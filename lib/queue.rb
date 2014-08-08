require_relative 'find'

class Queue

  include Find
  
  attr_accessor :results

  def initialize
    @results = {}
  end

end
