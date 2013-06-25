class Dispenser
	def initialize(button_adapter, motor_adapter, bin_adapter)
		@button_adapter = button_adapter
		@motor_adapter = motor_adapter
		@bin_adapter = bin_adapter
	end

	def tick
		if @button_adapter.pressed? and !@bin_adapter.down?
			@motor_adapter.turn_on
		else
			@motor_adapter.turn_off
		end
	end
end