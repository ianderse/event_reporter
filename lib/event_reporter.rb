require_relative '../lib/require_helper'
require_relative '../lib/user_commands'

class EventReporter

  include UserCommands

  def initialize(input, output)
    @messenger = Messenger.new(input, output)
    @queue = Queue.new
    @directory = Directory.new
    @input = input
    @choice = []
  end

  def run
    @messenger.welcome
    until quit?
      @messenger.command
      @choice = get_menu_input.split(' ')
      process_user_commands
    end
    # return 0
  end

  def get_menu_input
    @input.gets.strip.downcase
  end

  def quit?
    @choice.join == 'q' || @choice.join == 'quit'
  end

end
