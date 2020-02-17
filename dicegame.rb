# require_relative 'diceroller'

class Dicegame
  def run
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
    puts "You have" #link wallet
    puts "How much would you like to bet?"
    get_your_bet = gets.to_i
    puts "You bet #{get_your_bet}"
  end
  
  def play_the_game
    puts "What is your guess?"
    guess_num = gets.to_i
    case
    when guess_num > 6
      puts "too high"
      play_the_game
    when guess_num < 0 
      puts "too low"
      play_the_game
    end
    @die = 1 + rand(6)
    puts "The rolled die is : #{@die}"
    if @die == guess_num
      win_screen
    else 
      lose_screen
    end
  end
  
  def win_screen
    puts "How did you do that?!"
    puts "      You Won!       "
    puts "Would you like to play again?! y/n"
    play_again = gets.strip
    case 
    when 'y'
      run
    when 'n'
      puts "Thanks for playing!"
      #you have this much money
    end

  end

  def lose_screen
    puts "Better luck next time!"
    puts "Would you like to play again?! y/n"
    play_again_lose = gets.strip
    case
    when play_again_lose = 'y'
      run
    when play_again_lose = "n"
      puts "Thanks for playing!"
      #you have this much money
      #send back to main app
    end
  end


end
Dicegame.new.run