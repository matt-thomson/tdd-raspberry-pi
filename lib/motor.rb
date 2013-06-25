class Motor
	def initialize(button)
		@button = button
	end

	def tick
		if @button.is_pressed?
			turn_on
		else
			turn_off
		end
	end

	def turn_on
	end

	def turn_off
	end
end