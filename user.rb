require_relative 'wallet'

class User
  attr_accessor :name, :age
  def initialize(name, age)
    @name = name
    @age = age
  end

end