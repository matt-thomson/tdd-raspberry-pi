class IdleChecker
	def initialize(drawer_light)
		@drawer_light = drawer_light
		@idle_count = 0
	end

	def tick
		@idle_count += 1

		if @idle_count % 20 == 0
			@drawer_light.flash(1)
		end
	end
end