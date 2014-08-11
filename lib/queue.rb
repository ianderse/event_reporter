
class Queue

  attr_accessor :results

  def initialize
    @results = {}
  end

  def clear
    @results = Hash.new
  end

end
