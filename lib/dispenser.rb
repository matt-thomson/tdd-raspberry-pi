class Dispenser
	def initialize(button_adapter, motor_adapter)
		@button_adapter = button_adapter
		@motor_adapter = motor_adapter
	end

	def tick
		if @button_adapter.is_pressed?
			@motor_adapter.turn_on
		else
			@motor_adapter.turn_off
		end
	end
end