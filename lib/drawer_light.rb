class DrawerLight
	def initialize(led_adapter, flash_cycles)
		@led_adapter = led_adapter
		@is_on = false
		@flash_count = 0
		@flash_cycles = flash_cycles
	end

	def tick
		if @flash_count > 0
			turn_on = handle_flash
		else
			turn_on = @is_on
		end

		if turn_on
			@led_adapter.turn_on
		else
			@led_adapter.turn_off
		end
	end

	def handle_flash
		@flash_count -= 1
		if 2 * (@flash_count % @flash_cycles) < @flash_cycles
			return true
		else
			return false
		end
	end

	def turn_on
		@is_on = true
	end

	def turn_off
		@is_on = false
	end

	def flash(num_flashes)
		@flash_count = num_flashes * @flash_cycles
	end
end
