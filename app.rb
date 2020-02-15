# require_relative = 'deck'
# require_relative = 'dice'
require_relative 'user'
require_relative 'wallet'

class App 
    def initialize
        @user = User.new
        @wallet = Wallet.new(100)
        #to add things to this wallet use => @wallet.add("put the integer inside that you want to add")
        #to subtract an amount from the wallet use => @wallet.remove("put the integer inside that you want to subtract")
        menu()
    end
    def menu 
        puts '++++++++++++++++++++++'
        puts 'Welcome to ruby casino'
        puts '++++++++++++++++++++++'
        puts 'Please verify your age:'
        @user_age = @user.user_age
        user_entry()
        menu_games()
    end
    def user_entry
        if @user_age >= 21
            user_greet()
        else
            puts 'you\'re too young sorry, have a nice day :)'
            exit
        end
    end
    def user_greet
        puts 'What is your name?'
        @user_name = @user.user_name.chomp
        puts '++++++++++++++++++++++'
        puts "Hello #{@user_name} please choose a game"
        puts '++++++++++++++++++++++'
    end
    def menu_games
        puts '1) Slots'
        puts '2) High or Low'
        puts '3) Blackjack'
        puts '4) War'
        puts '5) exit'
        puts '++++++++++++++++++++++'
        user_choice = gets.to_i
        case user_choice
        when 1 
            puts 'you chose Slots'
        when 2
            puts 'you chose High or Low'
        when 3
            puts 'you chose Blackjack'
        when 4
            puts 'you chose War'
        when 5 
            puts '++++++++++++++++++++++'
            puts 'OK, have a nice day :)'
            puts '++++++++++++++++++++++'
            exit
        else
            puts '++++++++++++++++++++++'
            puts 'Invalid choice, please try again'
            puts '++++++++++++++++++++++'
            menu_games()
        end

    end


end

word = App.new
puts word