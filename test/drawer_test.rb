require File.join(File.dirname(__FILE__), 'test_helper')
require 'drawer'

class DrawerTest < Test::Unit::TestCase
	def test_led_switched_on_when_item_in_bin
		bin_adapter = stub(:is_down? => true)

		led_adapter = mock()
		led_adapter.expects(:turn_on)

		drawer = Drawer.new(bin_adapter, led_adapter)
		drawer.tick
	end

	def test_led_switched_off_when_bin_empty
		bin_adapter = stub(:is_down? => false)

		led_adapter = mock()
		led_adapter.expects(:turn_off)

		drawer = Drawer.new(bin_adapter, led_adapter)
		drawer.tick
	end
end