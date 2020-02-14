require_relative = 'deck'
require_relative = 'dice'
require_relative = 'user'

class App 
    def initialize
        menu
    end

    def create_user

    def menu 
        puts '++++++++++++++++++++++'
        puts 'Welcome to ruby casino'
        puts '++++++++++++++++++++++'
        puts 'Please verify your age:'
        @user_age = gets.to_i
        user_entry()
        #welcome user??
        menu_games()

    end
    def user_entry
        if @user_age >= 21
          
          menu_games()
        else
          puts "Come back when you are 21"
            
            exit
        end
    end
    def menu_games

    end


end
App.new
