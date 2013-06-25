require File.join(File.dirname(__FILE__), 'test_helper')
require 'drawer'

class DrawerTest < Test::Unit::TestCase
	def test_led_switched_on_when_item_in_bin
		bin_adapter = stub(:down? => true)

		drawer_light = mock()
		drawer_light.expects(:turn_on)

		drawer = Drawer.new(drawer_light, bin_adapter)
		drawer.tick
	end

	def test_led_switched_off_when_bin_empty
		bin_adapter = stub(:down? => false)

		drawer_light = mock()
		drawer_light.expects(:turn_off)

		drawer = Drawer.new(drawer_light, bin_adapter)
		drawer.tick
	end
end