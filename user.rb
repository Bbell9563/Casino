require_relative 'wallet'

class User
  attr_accessor :name, :wallet, :age
  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
  end

end