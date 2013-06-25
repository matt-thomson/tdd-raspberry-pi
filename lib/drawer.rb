class Drawer
	def initialize(bin_adapter, led_adapter)
		@bin_adapter = bin_adapter
		@led_adapter = led_adapter
	end

	def tick
		if @bin_adapter.is_down?
			@led_adapter.turn_on
		else
			@led_adapter.turn_off
		end
	end
end