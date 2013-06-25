require File.join(File.dirname(__FILE__), 'test_helper')
require 'motor'

class MotorTest < Test::Unit::TestCase
	def test_turns_on_motor_when_button_pressed
		button = stub(:is_pressed? => true)

		motor = Motor.new(button)
		motor.expects(:turn_on)
		motor.expects(:turn_off).never

		motor.tick
	end

	def test_turns_off_motor_when_button_not_pressed
		button = stub(:is_pressed? => false)

		motor = Motor.new(button)
		motor.expects(:turn_off)
		motor.expects(:turn_on).never

		motor.tick
	end
end