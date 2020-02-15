class Wallet
  attr_accessor :amount
  def initialize(amount)
    @amount = amount
  end

  def add(number)
    @amount += number

  end
  def remove(number)
    @amount -= number
  end

end

wallet = Wallet.new(100)
wallet.add(20)
puts wallet.amount