
class TimeslicedScheduler
  def execute(&block)
    @stopped = false
    while !@stopped do
      execute_in_timeslice(0.05, &block)
    end
  end

  def stop
    @stopped = true
  end

  def execute_in_timeslice(timeslice_in_s)
    begin_time = Time.now

    yield

    delta_time = Time.now - begin_time
    sleep(timeslice_in_s - delta_time)
  end
end

##
# Responsibilities:
# - keep executing adapters in real time
# - connect adapters to ports
class EventLoop
  attr_reader :display, :scheduler, :components

  def initialize(display, scheduler = TimeslicedScheduler.new)
    @display = display
    @scheduler = scheduler
    @components = []
  end

  def <<(component)
    components << component
  end

  def start
    display.show(0, "Welcome!")
  end

  def stop
    scheduler.stop
  end

  def execute
    start
    event_loop
  end

  def event_loop
    scheduler.execute do
      components.each do |component|
        component.tick
      end
    end
  end
end

