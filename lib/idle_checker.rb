class IdleChecker
	def initialize(drawer_light, button_adapter, bin_adapter)
		@drawer_light = drawer_light
		@button_adapter = button_adapter
		@bin_adapter = bin_adapter
		@idle_count = 0
	end

	def tick
		if idle?
			@idle_count += 1

			if @idle_count % 20 == 0
				@drawer_light.flash(1)
			end
		else
			@idle_count = 0
		end
	end

	def idle?
		return !(@button_adapter.pressed? || @bin_adapter.down?)
	end
end