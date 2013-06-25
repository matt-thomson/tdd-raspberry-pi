require 'pi_ports'

class LedAdapter
	def turn_on
		PiPorts::Pins.pin_3_high
	end

	def turn_off
		PiPorts::Pins.pin_3_low
	end
end