require_relative '../lib/require_helper'

class EventReporter

  def initialize(input, output)
    @messager = Messager.new(input, output)
    @queue = Queue.new
    @directory = Directory.new
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

  #lets move all user command processing into a helper module at some point
  #create better name for @choice[0] here, more readable.

  def process_user_commands
    case
    when @choice[0] == 'help' || @choice[0] == 'h'
      help(@choice[1])
    when @choice[0] == 'load' || @choice[0] == 'l'
      load_command(@choice[1])
    when @choice[0] == 'find'
      #move to a find helper method
      if @choice[1] == nil
        @messager.invalid_find
      else
        if @directory.directory != nil
          if @directory.find_by(@choice[1].to_sym, @choice[2]) != "invalid"
            @queue.results = @directory.find_by(@choice[1].to_sym, @choice[2])
            @messager.queue_loaded
          else
            @messager.invalid_search
          end
        else
          @messager.no_directory_loaded
        end
      end
    when @choice[0] == 'queue'
      #move to a queue helper method
      if @choice[1] == nil
        @messager.invalid_queue_command
      elsif @choice[1] == 'print'
        @messager.print_queue(@queue)
      elsif @choice[1] == 'clear'
        @queue.clear
        @messager.queue_cleared
      end
    when quit?
      @messager.quit
      return 0
    end
  end

  def load_command(param="event_attendees.csv")
    if !@directory.file_exist?("data/" +"#{param}")
      @messager.file_does_not_exist
    else
      @directory.load_content
      @messager.content_loaded
    end
  end

  def help(param=nil)
    case param
    when nil
      @messager.list_commands
    when "queue"
      help_queue
    when "load"
      @messager.explain_load
    when "find"
      @messager.explain_find
    end
  end

  def help_queue
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

end
