class DrawerLight
	def initialize(led_adapter)
		@led_adapter = led_adapter
		@is_on = false
		@flash_count = 0
	end

	def tick
		if @flash_count > 0
			@flash_count -= 1
			if @flash_count % 10 < 5
				@led_adapter.turn_on
			else
				@led_adapter.turn_off
			end
		elsif @is_on
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

	def flash
		@flash_count = 30
	end
end
