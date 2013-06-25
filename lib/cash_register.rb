class CashRegister
  def initialize(display, coin_slot)
    @display = display
    @coin_slot = coin_slot
  end

  def tick
    coin = @coin_slot.inserted_coin

    if coin > 0
      @display.show("Credits: #{coin}")
    end
  end
end