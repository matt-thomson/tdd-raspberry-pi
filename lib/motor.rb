require 'pi_ports'

class Motor
	def initialize(button)
		@button = button
	end

	def tick
		if @button.is_pressed?
			turn_on
		else
			turn_off
		end
	end

	def turn_on
		PiPorts::Pins.pin_0_high
	end

	def turn_off
		PiPorts::Pins.pin_0_low
	end
end