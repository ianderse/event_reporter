require_relative 'messager'

class EventReporter

  def initialize(input, output)
    @messager = Messager.new(input, output)
    @input = input
  end

  def run
    @messager.welcome
    until quit?
      @messager.command
      @choice = get_menu_input
      process_user_commands
    end
    return 0
  end

  def process_user_commands
    case
    when help?
      @messager.list_commands
    when quit?
      @messager.quit
      return 0
    end
  end

  def help(param=nil)
    if param.downcase == "queue"
      "explain queue"
    else
      "list commands"
    end
  end

  def get_menu_input
    @input.gets.strip.downcase
  end

  def quit?
    @choice == 'q' || @choice == 'quit'
  end

  def help?
    @choice == 'h' || @choice == 'help'
  end

end
