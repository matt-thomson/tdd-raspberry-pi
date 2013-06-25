require 'pi_ports'

class Button
	def is_pressed?
		return PiPorts::Pins.pin_1_high?
	end
end