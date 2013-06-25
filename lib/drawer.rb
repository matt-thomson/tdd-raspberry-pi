class Drawer
	def initialize(drawer_light, bin_adapter)
		@drawer_light = drawer_light
		@bin_adapter = bin_adapter
	end

	def tick
		if @bin_adapter.down?
			@drawer_light.turn_on
		else
			@drawer_light.turn_off
		end
	end
end