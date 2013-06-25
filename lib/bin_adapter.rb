require 'pi_ports'

class BinAdapter
	def is_down?
		return PiPorts::Pins.pin_4_high?
	end
end