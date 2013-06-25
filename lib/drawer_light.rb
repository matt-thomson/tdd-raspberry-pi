class DrawerLight
	def initialize(led_adapter)
		@led_adapter = led_adapter
		@is_on = false
	end

	def tick
		if @is_on
			@led_adapter.turn_on
		else
			@led_adapter.turn_off
		end
	end

	def turn_on
		@is_on = true
	end

	def turn_off
		@is_on = false
	end
end
