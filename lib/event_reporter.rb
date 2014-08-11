require_relative 'messager'
require_relative 'CSV_handler'

class EventReporter

  def initialize(input, output)
    @messager = Messager.new(input, output)
    @input = input
    @choice = []
  end

  def run
    @messager.welcome
    until quit?
      @messager.command
      @choice = get_menu_input.split(' ')
      process_user_commands
    end
    return 0
  end

  def process_user_commands
    case
    when @choice[0] == 'help' || @choice[0] == 'h'
      help(@choice[1])
    when @choice[0] == 'load' || @choice[0] == 'l'
      load_command(@choice[1])
    when quit?
      @messager.quit
      return 0
    end
  end

  def load_command(param="event_attendees.csv")
    @handler = CSVHandler.new
    if @handler.load_content(param) == "File does not exist."
      @messager.file_does_not_exist
    else
      @messager.content_loaded
    end
  end

  def help(param=nil, param2=nil)
    case param
    when nil
      @messager.list_commands
    when "queue"
      queue
    when "load"
      @messager.explain_load
    when "find"
      @messager.explain_find
    end
  end

  def queue
    if @choice[3] != nil
      param = @choice[2]+@choice[3]
    else
      param = @choice[2]
    end

    case param
    when nil
      @messager.explain_queue
    when 'count'
      @messager.explain_queue_count
    when 'printby'
      @messager.explain_queue_print_by
    when 'print'
      @messager.explain_queue_print
    when 'clear'
      @messager.explain_queue_clear
    when 'saveto'
      @messager.explain_queue_save_to
    else
      @messager.does_not_exist
    end

  end

  def get_menu_input
    @input.gets.strip.downcase
  end

  def quit?
    @choice.join == 'q' || @choice.join == 'quit'
  end

  def help?
    @choice.join == 'h' || @choice.join == 'help'
  end

end
