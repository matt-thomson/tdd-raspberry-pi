require 'pi_ports'

class ButtonAdapter
	def is_pressed?
		return PiPorts::Pins.pin_1_high?
	end
end