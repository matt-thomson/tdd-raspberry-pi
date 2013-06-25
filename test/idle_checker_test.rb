require File.join(File.dirname(__FILE__), 'test_helper')
require 'idle_checker'

class IdleCheckerTest < Test::Unit::TestCase
	def test_should_flash_every_second_if_idle
		drawer_light = mock()

		button_adapter = stub(:pressed? => false)
		bin_adapter = stub(:down? => false)

		idle_checker = IdleChecker.new(drawer_light, button_adapter, bin_adapter)

		(1...20).each do |n|
			idle_checker.tick
		end

		drawer_light.expects(:flash).with(1)
		idle_checker.tick
	end

	def test_should_reset_count_if_button_pressed
		drawer_light = mock()

		button_adapter = stub(:pressed? => false)
		bin_adapter = stub(:down? => false)

		idle_checker = IdleChecker.new(drawer_light, button_adapter, bin_adapter)

		(1...10).each do |n|
			idle_checker.tick
		end

		button_adapter.stubs(:pressed? => true)
		idle_checker.tick
		button_adapter.stubs(:pressed? => false)

		(1...20).each do |n|
			idle_checker.tick
		end

		drawer_light.expects(:flash).with(1)
		idle_checker.tick
	end

	def test_should_reset_count_if_bin_down
		drawer_light = mock()

		button_adapter = stub(:pressed? => false)
		bin_adapter = stub(:down? => false)

		idle_checker = IdleChecker.new(drawer_light, button_adapter, bin_adapter)

		(1...10).each do |n|
			idle_checker.tick
		end

		bin_adapter.stubs(:down? => true)
		idle_checker.tick
		bin_adapter.stubs(:down? => false)

		(1...20).each do |n|
			idle_checker.tick
		end

		drawer_light.expects(:flash).with(1)
		idle_checker.tick
	end
end