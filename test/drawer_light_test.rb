require File.join(File.dirname(__FILE__), 'test_helper')
require 'drawer_light'

class DrawerLightTest < Test::Unit::TestCase
	def test_light_should_be_off_initially
		led_adapter = mock()
		led_adapter.expects(:turn_off)

		drawer_light = DrawerLight.new(led_adapter)

		drawer_light.tick
	end

	def test_should_turn_light_on_during_tick_when_requested
		led_adapter = mock()
		led_adapter.expects(:turn_on)

		drawer_light = DrawerLight.new(led_adapter)
		drawer_light.turn_on

		drawer_light.tick
	end

	def test_should_turn_light_off_during_tick_when_requested
		led_adapter = mock()
		led_adapter.expects(:turn_off)

		drawer_light = DrawerLight.new(led_adapter)
		drawer_light.turn_off

		drawer_light.tick
	end

	def test_should_flash_light_correctly_when_requested
		led_adapter = mock()

		drawer_light = DrawerLight.new(led_adapter)
		drawer_light.flash

		# Flash 3 times, for 250ms (5 ticks) each.
		(1..3).each do |n|
			(1..5).each do |n|
				led_adapter.expects(:turn_off)
				drawer_light.tick
			end

			(1..5).each do |n|
				led_adapter.expects(:turn_on)
				drawer_light.tick
			end
		end
	end
end