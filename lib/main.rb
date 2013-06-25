#!/usr/bin/env ruby
$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'pi_ports'
require 'pi_ports/usb'
require 'eventloop'

require 'button_adapter'
require 'motor_adapter'
require 'bin_adapter'
require 'led_adapter'

require 'dispenser'
require 'drawer'
require 'drawer_light'
require 'idle_checker'

class FakeDisplay
  def show(line_nr, text)
    puts "#{line_nr}: #{text}"
  end
end

def terminate(eventloop, message)
  puts message
  eventloop.stop
  exit
end

# Catch signals SIGINT and SIGTERM for appropriate shutdown
def exit_on_signals(eventloop)
  Signal.trap("INT") do # necessary because ctrl-c will arrive as a raw character and not be taken into account
    terminate(eventloop, "User interrupt")
  end

  Signal.trap("TERM") do
    terminate(eventloop, "Terminating")
  end
end

##
# Main - Responsibilities:
# - handle user interrupt
# - wiring: connects ports to physical outputs

puts "Starting..."

display = FakeDisplay.new

eventloop = EventLoop.new(display)
# Add a component responding to the event loop like this
# eventloop << MyComponent.new
# your component should have a 'tick' method

led_adapter = LedAdapter.new
drawer_light = DrawerLight.new(led_adapter, 10)
eventloop << drawer_light

button_adapter = ButtonAdapter.new
motor_adapter = MotorAdapter.new
eventloop << Dispenser.new(drawer_light, button_adapter, motor_adapter, bin_adapter)

bin_adapter = BinAdapter.new
eventloop << Drawer.new(drawer_light, bin_adapter)

eventloop << IdleChecker.new(drawer_light, button_adapter, bin_adapter)

exit_on_signals(eventloop)
eventloop.execute

PiPorts::Pins.all_pins_low

puts "Finished"

