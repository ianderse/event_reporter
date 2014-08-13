class Messager
  def initialize(input=$stdin, output=$stdout)
    @input = input
    @output = output
  end

  def welcome
    @output.puts "Welcome to EventReporter"
  end

  def queue_loaded
    @output.puts "Queue loaded with results of the search."
  end

  def queue_saved
    @output.puts "Queue saved."
  end

  def print_queue(queue)
    @output.puts queue.create_table
  end

  def print_sorted_queue(queue, param)
    #can just do this from event_reporter?
    queue.sort_queue(param)
    @output.puts queue.create_table
  end

  def queue_size(queue)
    @output.puts queue.size
  end

  def queue_cleared
    @output.puts "Queue cleared."
  end

  def list_commands
    @output.puts "\nList of commands"
    @output.puts "help - displays this list."
    @output.puts "help <command> - description of how to use the command."
    explain_load
    explain_queue_count
    explain_queue_clear
    explain_queue_print
    explain_queue_print_by
    explain_queue_save_to
    explain_find
    @output.puts
  end

  def content_loaded
    @output.puts "Content succesfully loaded."
  end

  def file_does_not_exist
    @output.puts "File does not exist."
  end

  def invalid_find
    @output.puts "Please input find parameters (find <attribute> <criteria>)."
  end

  def invalid_search
    @output.puts "Invalid search entered, please try again."
  end

  def invalid_save
    @output.puts "Invalid save format, please use format 'save to <filename>'"
  end

  def no_directory_loaded
    @output.puts "No directory loaded, please use load command first."
  end

  def invalid_queue_command
    @output.puts "Please enter valid queue command.  'help queue' for help."
  end

  def quit
    @output.puts "Thank you for using EventReporter."
    @output.puts "Goodbye."
  end

  def command
    @output.print "Please enter a command (Enter 'help' for list of commands): "
  end

  def explain_queue
    @output.puts "List of queue commands"
    explain_queue_count
    explain_queue_clear
    explain_queue_print
    explain_queue_print_by
    explain_queue_save_to
  end

  def explain_queue_count
    @output.puts "queue count - output how many records are in the current queue."
  end

  def explain_queue_print_by
    @output.puts "queue print by <attribute> - print data table sorted by the specified attribute (ie. zipcode)."
  end

  def explain_queue_print
    @output.puts "queue print - print out a tab-delimited data table with a header row."
  end

  def explain_queue_clear
    @output.puts "queue clear - empty the queue"
  end

  def explain_queue_save_to
    @output.puts "queue save to <filename.csv> - export current queue to specified filename as a CSV file."
  end

  def explain_load
    @output.puts "load <filename> - loads a CSV file from <filename> path, if no path given, it loads data/event_attendees.csv."
  end

  def explain_find
    @output.puts "find <attribute> <criteria> - load the queue with all records matching criteria for the given attribute (ie. find zipcode 20011)."
  end

  def does_not_exist
    @output.puts "Command does not exist, please try again."
  end
end
