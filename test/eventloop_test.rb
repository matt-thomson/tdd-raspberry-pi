require File.join(File.dirname(__FILE__),'test_helper')
require 'eventloop'

class EventloopTest < Test::Unit::TestCase
  attr_reader :display, :executor, :eventloop,  :component

  def setup
    @display = mock("Display")
    display.stub_everything

    @executor = mock("Executor")
    executor.stubs(:execute).yields

    @eventloop = EventLoop.new(display, executor)

    @component = mock("Component")
  end

  def test_shows_message_when_started
    display.expects(:show).with(0, "Welcome!")
    eventloop.execute
  end

  def test_stop_stops_the_executor
    executor.expects(:stop)
    eventloop.stop
  end

  def test_execure_ticks_component
    eventloop << component
    component.expects(:tick)
    eventloop.execute
  end

  def test_execure_ticks_multiple_components
    eventloop << component
    eventloop << component
    component.expects(:tick).twice
    eventloop.execute
  end

end

