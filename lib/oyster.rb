class Oyster

  attr_reader :balance

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(money)
    raise("Balance will exceed £#{MAX_BALANCE} maximum") if (@balance + money) > MAX_BALANCE

    @balance += money
  end

  def in_journey?
    @in_use
  end

  def touch_in
    raise "Not enough money" if @balance < MIN_BALANCE
    @in_use = true
    "Touched in"
  end

  def touch_out
    deduct(MIN_BALANCE)
    @in_use = false
    "Touched out"
  end

  private
  def deduct(money)
    @balance -= money
  end
end
