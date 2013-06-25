require 'pi_ports'

class ButtonAdapter
	def pressed?
		return PiPorts::Pins.pin_1_high?
	end
end