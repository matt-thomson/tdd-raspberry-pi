require File.join(File.dirname(__FILE__), 'test_helper')
require 'dispenser'

class MotorTest < Test::Unit::TestCase
	def test_turns_on_motor_when_button_pressed_and_bin_empty
		drawer_light = mock("a drawer light")

		button_adapter = stub(:pressed? => true)

		motor_adapter = mock("a motor adapter")
		motor_adapter.expects(:turn_on)

        bin_adapter = stub(:down? => false)

		motor = Dispenser.new(drawer_light, button_adapter, motor_adapter, bin_adapter)
		motor.tick
	end

	def test_turns_off_motor_and_flashes_light_when_button_pressed_and_item_in_bin
		drawer_light = mock("a drawer light")
		drawer_light.expects(:flash).with(3)
		
		button_adapter = stub(:pressed? => true)

		motor_adapter = mock("a motor adapter")
		motor_adapter.expects(:turn_off)

        bin_adapter = stub(:down? => true)

		motor = Dispenser.new(drawer_light, button_adapter, motor_adapter, bin_adapter)
		motor.tick
	end

	def test_turns_off_motor_when_button_not_pressed
		drawer_light = mock("a drawer light")
		
		button_adapter = stub(:pressed? => false)

		motor_adapter = mock("a motor adapter")
		motor_adapter.expects(:turn_off)

		bin_adapter = stub()

		motor = Dispenser.new(drawer_light, button_adapter, motor_adapter, bin_adapter)
		motor.tick
	end
end