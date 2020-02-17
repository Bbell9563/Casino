#rules to slots 
#how much money you put in
#display amount put in
#pull the lever
#'spins symbols'
#if two line up give money (doubles amount)
#if three line up give money (triples amount) 
#if none the player looses money
#if jackpot * 3 player gets a lot of money
# require_relative 'app'
require_relative 'wallet'

class Slots 
    def initialize
        @wallet = Wallet.new
        game
    end
    def random_symbols
        symbols = ['[7]', '[Clover]', '[Bell]', '[BAR]', '[Fruit]', '[Diamond]', '[JACKPOT]']
        get_random_symbol = symbols [rand(symbols.length)]
    end
    def bet_money
        if @wallet.amount == 0
            puts "Your current balance is #{@wallet.amount} you don't have enough to play..."
            puts 'Thank you for wasting all your money at Ruby casino, have a nice day!'

            exit 
        else
        end
        puts '++++++++++++++++++++++'
        puts 'How much money would you like to bet?'
        puts '++++++++++++++++++++++'
        puts "Your current balance is #{@wallet.amount}"
        @user_money = gets.to_i
    end
    def slot_symbols
        @slots = [random_symbols, random_symbols, random_symbols]
        puts '-----------------------------------------'
        puts '|                                       |'
        puts '|                - RUBY-                |'
        puts '| _____________________________________ |'
        puts "       #{@slots[0]} | #{@slots[1]} | #{@slots[2]} "
        puts '| ------------------------------------- |  ( )'
        puts '|                                       |   |'
        puts '|                                       |   |'
        puts '----------------------------------------- __|'
        puts '|                                       |'
        puts '|        |____________________|         |'
        puts '-----------------------------------------'
        if @slots[0] == @slots[1]
            puts '++++++++++++++++++++++'
            puts 'You got two of the same!'
            puts '++++++++++++++++++++++'
            @add_to_wallet = @wallet.add(@user_money * 2)
            puts "Your current balance is #{@wallet.amount}"
        elsif @slots[0] == @slots[1] && @slots[1] == @slots[2]
            puts '++++++++++++++++++++++'
            puts 'JACKPOT!!!'
            puts '++++++++++++++++++++++'
            @add_to_wallet = @wallet.add(@user_money * 5)
            puts "Your current balance is #{@wallet.amount}"
        else
            puts '++++++++++++++++++++++'
            puts 'YOU WON... nothing!'
            puts '++++++++++++++++++++++'
            @remove_from_wallet = @wallet.remove(@user_money)
            puts "Your current balance is #{@wallet.amount}"
        end
        bet_pull
    end
    def bet_pull
        puts 'would you like to play? ( Yes or No )'
        @user_decision = gets.upcase.chomp
        if @user_decision == 'YES'
            bet_money
        elsif @user_decision == 'NO'
            puts 'Ok, have a nice day :)'
            App.new.menu
        else 
            puts 'invalid choice, try again'
            bet_pull
        end
        puts '-----------------------------------------'
        puts '|                                       |'
        puts '|                - RUBY-                |'
        puts '| _____________________________________ |'
        puts '|         [BAR] | [BAR] | [BAR]         |'
        puts '| ------------------------------------- |  ( )'
        puts '|                                       |   |'
        puts '|                                       |   |'
        puts '----------------------------------------- __|'
        puts '|                                       |'
        puts '|        |____________________|         |'
        puts '-----------------------------------------'
        puts "Type 'pull' to roll or 'exit' to leave"
        @user_decision_2 = gets.upcase.chomp
        if @user_decision_2 == 'PULL'
            slot_symbols
        elsif @user_decision_2 == 'EXIT'
            puts 'Ok, have a nice day :)'
            App.new.menu
        else
            puts 'invalid choice, try again'
            game
        end
    end
    def game
        puts '++++++++++++++++++++++'
        puts 'Welcome to ruby slots!'
        puts '++++++++++++++++++++++'
        bet_pull
    end


end
