require 'pi_ports'

class MotorAdapter
	def turn_on
		PiPorts::Pins.pin_0_high
	end

	def turn_off
		PiPorts::Pins.pin_0_low
	end
end