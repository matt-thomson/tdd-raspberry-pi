require File.join(File.dirname(__FILE__), 'test_helper')
require 'cash_register'

class CashRegisterTest < Test::Unit::TestCase
  def test_displays_credit_when_coin_inserted
    display_mock = mock("a display")
    display_mock.expects(:show).with("Credits: 20")

    coin_slot_stub = stub(:inserted_coin => 20)

    cash_register = CashRegister.new(display_mock, coin_slot_stub)
    cash_register.tick
  end

  def test_displays_nothing_when_nothing_inserted
    display_mock = mock("a display")
    display_mock.expects(:show).never

    coin_slot_stub = stub(:inserted_coin => 0)

    cash_register = CashRegister.new(display_mock, coin_slot_stub)
    cash_register.tick
  end
end
