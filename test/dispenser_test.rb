require File.join(File.dirname(__FILE__), 'test_helper')
require 'dispenser'

class MotorTest < Test::Unit::TestCase
	def test_turns_on_motor_when_button_pressed_and_bin_empty
		button_adapter = stub(:is_pressed? => true)

		motor_adapter = mock("a motor adapter")
		motor_adapter.expects(:turn_on)

        bin_adapter = stub(:is_down? => false)

		motor = Dispenser.new(button_adapter, motor_adapter, bin_adapter)
		motor.tick
	end

	def test_turns_off_motor_when_button_pressed_and_item_in_bin
		button_adapter = stub(:is_pressed? => true)

		motor_adapter = mock("a motor adapter")
		motor_adapter.expects(:turn_off)

        bin_adapter = stub(:is_down? => true)

		motor = Dispenser.new(button_adapter, motor_adapter, bin_adapter)
		motor.tick
	end

	def test_turns_off_motor_when_button_not_pressed
		button_adapter = stub(:is_pressed? => false)

		motor_adapter = mock("a motor adapter")
		motor_adapter.expects(:turn_off)

		bin_adapter = stub()

		motor = Dispenser.new(button_adapter, motor_adapter, bin_adapter)
		motor.tick
	end
end