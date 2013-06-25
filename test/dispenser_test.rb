require File.join(File.dirname(__FILE__), 'test_helper')
require 'dispenser'

class MotorTest < Test::Unit::TestCase
	def test_turns_on_motor_when_button_pressed
		button_adapter = stub(:is_pressed? => true)

		motor_adapter = mock("a motor adapter")
		motor_adapter.expects(:turn_on)

		motor = Dispenser.new(button_adapter, motor_adapter)
		motor.tick
	end

	def test_turns_off_motor_when_button_not_pressed
		button_adapter = stub(:is_pressed? => false)

		motor_adapter = mock("a motor adapter")
		motor_adapter.expects(:turn_off)

		motor = Dispenser.new(button_adapter, motor_adapter)
		motor.tick
	end
end