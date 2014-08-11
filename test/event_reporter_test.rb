gem 'minitest'
require 'csv'
require 'minitest/autorun'
require_relative '../lib/event_reporter'

class EventReporterTest < Minitest::Test

  def setup
    @event = EventReporter.new($stdin, $stdout)
  end

  def test_it_can_call_help
    @event.help
  end

end
