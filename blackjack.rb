require_relative 'deck'
require_relative 'card'
require_relative 'wallet'

class Blackjack 
  def initialize
    @deck = Deck.new
    @player_cards = []
    @dealer_cards = []
    @player_score = 0
    @dealer_score = 0 
    @player_bet = 0
  end

  def deal_cards(card)
    card << @deck.deal_card
    card << @deck.deal_card
  end

  def add_score(score, cards, name)
    score = 0
    cards.each do |card|
      if card.rank.to_s == 'K' || card.rank.to_s == 'Q' || card.rank.to_s == 'J'|| card.rank.to_s == '10'
        score += 10
      elsif card.rank.to_s =="A"
        if score + 11 <= 21
          score += 11
        else  
          score += 1 
        end
      else  
        integer_score = card.rank.to_i 
        score += integer_score
      end
    end 
    puts "#{name} score is #{score}"
    return score
  end

  def dealer_choice 
    if @dealer_score <= @player_score 
      @dealer_cards << @deck.deal_card
      @dealer_score = add_score(@dealer_score, @dealer_cards, "Dealer")
      if @dealer_score > 21
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "You win!, Dealer bust"
        @wallet.amount += @player_bet 
        @wallet.amount += @player_bet 
        clear_game
      else  
        dealer_choice 
      end
    else   
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "The dealer wins"
      clear_game
    end 
  end

  def clear_game
    @player_cards.clear
    @dealer_cards.clear
    @player_bet = 0
  end

  def player_choice 
    puts "Press enter to hit or type 'stay' to stay"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    player_stay = gets.chomp
    if player_stay == 'stay'
      puts "Its the dealers turn"
      dealer_choice
    else  
      @player_cards.each do |card|
        puts "#{card.rank} #{card.suit} (#{card.color})"
      end
      @player_cards <<@deck.deal_card
      @player_score = add_score(@player_score, @player_cards, "Your")
      if @player_score > 21 
        puts "Sorry you lost $#{@player_bet}"
        clear_game
      else  
        player_choice
      end
    end 
  end

  def ask_for_bet
    puts "Its time to bet"
    puts "~~~~~~~~~~~~~~~"
    puts "Minimum bet is 5 dollars"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "You have #{@wallet.amount}"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "How much would you like to bet?"
    player_bet = true
    while player_bet == true 
      bet = gets.to_i
      if bet >= 5
        if @wallet.check_balance(bet) == true
          @player_bet += bet
          @wallet.remove(bet)
          puts "Okay, your bet was $#{bet}"
          puts "You have $#{@wallet.amount} left in your wallet"
          puts "Lets play"
          return player_bet == false
        else  
          puts "Sorry, you do not have enough to make that bet"
        end
      else  
        puts "Thats not enough to play a game"
        puts "Please try again"
        true
      end
    end 
  end 

  def play_game(wallet)
    puts "
                          _                              
   /\\_/\\___  _   _    ___| |__   ___  ___  ___           
   \\_ _/ _ \\| | | |  / __| '_ \\ / _ \\/ __|/ _ \\          
    / \\ (_) | |_| | | (__| | | | (_) \\__ \\  __/  _ _ _ _ 
    \\_/\\___/ \\__,_|  \\___|_| |_|\\___/|___/\\___| (_|_|_|_)
                                      
"                                 
    puts "
    ____    ___                    __       _____                   __         
   /\\  _`\\ /\\_ \\                  /\\ \\     /\\___ \\                 /\\ \\        
   \\ \\ \\L\\ \\//\\ \\      __      ___\\ \\ \\/'\\ \\/__/\\ \\     __      ___\\ \\ \\/'\\    
    \\ \\  _ <'\\ \\ \\   /'__`\\   /'___\\ \\ , <    _\\ \\ \\  /'__`\\   /'___\\ \\ , <    
     \\ \\ \\L\\ \\\\_\\ \\_/\\ \\L\\.\\_/\\ \\__/\\ \\ \\\\`\\ /\\ \\_\\ \\/\\ \\L\\.\\_/\\ \\__/\\ \\ \\\\`\\  
      \\ \\____//\\____\\ \\__/.\\_\\ \\____\\\\ \\_\\ \\_\\ \\____/\\ \\__/.\\_\\ \\____\\\\ \\_\\ \\_\\
       \\/___/ \\/____/\\/__/\\/_/\\/____/ \\/_/\\/_/\\/___/  \\/__/\\/_/\\/____/ \\/_/\\/_/
                                                                               
                                                                               
   "
    # puts "♥︎, ♦,♠,♣"
    player_playing = true
    while player_playing == true
      @wallet = wallet
      ask_for_bet
      puts "Your cards are:"
      deal_cards(@player_cards)
      @player_score = add_score(@player_score, @player_cards, "Your")
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
      deal_cards(@dealer_cards)
      @dealer_score = add_score(@dealer_score, @dealer_cards, "Dealer")
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
      player_choice 
      puts "press enter to replay or 'QUIT' to quit"
      player_done = gets.chomp
      if player_done =='QUIT'
        return @wallet
      else  
        player_playing == true 
      end
    end
  end
end
