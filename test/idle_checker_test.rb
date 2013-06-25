require File.join(File.dirname(__FILE__), 'test_helper')
require 'idle_checker'

class IdleCheckerTest < Test::Unit::TestCase
	def test_should_flash_every_second_if_idle
		drawer_light = mock()

		idle_checker = IdleChecker.new(drawer_light)

		(1...20).each do |n|
			idle_checker.tick
		end

		drawer_light.expects(:flash).with(1)
		idle_checker.tick
	end
end