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

  def check_balance(number)
    return number <= @amount
  end

end



#Brianna -USING THE .check_balance METHOD TO CHECK IF THE USER HAS ENOUGH MONEY TO PLAYUYFA543
#
wallet = Wallet.new(100)

user_input = gets.to_i
if wallet.check_balance(user_input) == true
  puts "returned true"
else
  puts "returned false"
end

