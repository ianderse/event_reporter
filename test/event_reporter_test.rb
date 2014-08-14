gem 'minitest'
require 'csv'
require 'minitest/autorun'
require_relative '../lib/event_reporter'

class EventReporterTest < Minitest::Test

  def setup
    @test_output = StringIO.new
    @event = EventReporter.new($stdin, @test_output)
  end

  def test_it_can_call_help
    expected_help_output = "
List of commands
help - displays this list.
help <command> - description of how to use the command.
load <filename> - loads a CSV file from <filename> path, if no path given, it loads data/event_attendees.csv.
queue count - output how many records are in the current queue.
queue clear - empty the queue
queue print - print out a tab-delimited data table with a header row.
queue print by <attribute> - print data table sorted by the specified attribute (ie. zipcode).
queue save to <filename.csv> - export current queue to specified filename as a CSV file.
find <attribute> <criteria> - load the queue with all records matching criteria for the given attribute (ie. find zipcode 20011).

"
    @event.help(nil)

  assert_equal(@test_output.string, expected_help_output)
  end

end
