class Dispenser
	def initialize(button, motor_adapter)
		@button = button
		@motor_adapter = motor_adapter
	end

	def tick
		if @button.is_pressed?
			@motor_adapter.turn_on
		else
			@motor_adapter.turn_off
		end
	end
end