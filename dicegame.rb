require_relative 'wallet'

class Dicegame

  def initialize
    @betmade = 0
  end

  def run(wallet)
    @wallet = wallet
    main_dice_menu
    place_your_bet
    play_the_game
  end
  
  def main_dice_menu
    puts "--------Welcome to the Dice Game!--------"
    puts "----I am going to roll a single die!-----"
    puts "-If you guess the rolled number, you win!-"
    puts "-If you don't guess the number, you lose!-"
    puts "------------------------------------------"
  end
  
  def place_your_bet
    puts "You have #{@wallet.amount}" #link wallet
    puts "How much would you like to bet?"
    @get_bet = get_your_bet = gets.to_i
    if get_your_bet > 0
      if @wallet.check_balance(get_your_bet) == true
        @betmade += get_your_bet
        puts "You bet #{get_your_bet}"
      else
        puts "Bet a different number"
        place_your_bet
      end

    else 
      puts "Bet a different number"
      place_your_bet
    end

  end
  
  def play_the_game
    puts "What is your guess?"
    guess_num = gets.to_i
    case
    when guess_num > 6
      puts "too high"
      play_the_game
    when guess_num <= 0 
      puts "too low"
      play_the_game
    # else 
    #   puts "Guess a number 1 - 6"
    #   play_the_game
    end
    @die = 1 + rand(6)
    puts "The rolled die is : #{@die}"
    if @die == guess_num
      @wallet.add(@get_bet)
      win_screen
    else 
      @wallet.remove(@get_bet)
      lose_screen
    end
  end
  
  def win_screen
    puts "How did you do that?!"
    puts "      You Won!       "
    puts "Would you like to play again?! y/n"
    play_again = gets.chomp
    case 
    when play_again == 'y'
      place_your_bet
      play_the_game
    when play_again == 'n'
      puts "Thanks for playing!"
      puts "You have #{@wallet.amount}!"
      return @wallet
    else 
      puts "Please try again"
      win_screen
    end

  end

  def lose_screen
    puts "Better luck next time!"
    puts "Would you like to play again?! y/n"
    play_again_lose = gets.chomp
    case
    when play_again_lose == 'y'
      place_your_bet
      play_the_game
    when play_again_lose == "n"
      puts "Thanks for playing!"
      puts "You have #{@wallet.amount}!"
      return @wallet
    else 
      puts "Please try again"
      lose_screen
    end
  end
end