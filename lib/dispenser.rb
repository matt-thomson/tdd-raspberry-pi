class Dispenser
	def initialize(drawer_light, button_adapter, motor_adapter, bin_adapter)
		@drawer_light = drawer_light
		@button_adapter = button_adapter
		@motor_adapter = motor_adapter
		@bin_adapter = bin_adapter
	end

	def tick
		if @button_adapter.pressed?
			if @bin_adapter.down?
				@drawer_light.flash(3)
				@motor_adapter.turn_off
			else
				@motor_adapter.turn_on
			end
		else
			@motor_adapter.turn_off
		end
	end
end