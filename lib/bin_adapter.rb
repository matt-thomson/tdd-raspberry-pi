require 'pi_ports'

class BinAdapter
	def down?
		return PiPorts::Pins.pin_4_high?
	end
end