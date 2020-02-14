require_relative = 'deck'
require_relative = 'dice'

class App 
    def initialize
        menu
    end
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
            
            exit
        end
    end
    def menu_games

    end


end
App.new