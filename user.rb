require_relative 'wallet'

class User
    attr_accessor 
    def initialize
        @user_name 
        @user_age 
    end
    def user_name
        @user_name = gets.to_s
    end
    def user_age
        @user_age = gets.to_i
    end
end