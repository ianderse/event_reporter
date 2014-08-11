class Messager
  def initialize(input, output)
    @input = input
    @output = output
  end

  def welcome
    @output.puts "Welcome to EventReporter"
    command
  end

  def list_commands
    @output.puts "\nList of commands"
    @output.puts "help - displays this list."
    @output.puts "help <command> - description of how to use the command."
    @output.puts "queue count - output how many records are in the current queue."
    @output.puts "queue clear - empty the queue"
    @output.puts "queue print - print out a tab-delimited data table with a header row."
    @output.puts "queue print by <attribute> - print data table sorted by the specified attribute (ie. zipcode)."
    @output.puts "queue save to <filename.csv> - export current queue to specified filename as a CSV file."
    @output.puts "find <attribute> <criteria> - load the queue with all records matching criteria for the given attribute (ie. find zipcode 20011).\n\n"
  end

  def quit
    @output.puts "Thank you for using EventReporter."
    @output.puts "Goodbye."
  end

  def command
    @output.print "Please enter a command (Enter 'help' for list of commands): "
  end
end
