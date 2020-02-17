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

  def deal_player_cards
    @player_cards << @deck.deal
    @player_cards << @deck.deal
    

  end

  def deal_dealer_cards
    @dealer_cards <<@deck.deal
    @dealer_cards <<@deck.deal
  end

  def add_player_score
    @player_score = 0
    @player_cards.each do |card|
      if card.rank.to_s == 'K' || card.rank.to_s == 'Q' || card.rank.to_s == 'J'|| card.rank.to_s == '10'
        @player_score += 10
      elsif card.rank.to_s =="A"
        if @player_score + 11 <= 21
          @player_score += 11
        else  
          @player_score += 1 
        end
      else  
        integer_score = card.rank.to_i 
        @player_score += integer_score
      end
    end 
    puts "Your current score is #{@player_score}"
  end

  def add_dealer_score
    @dealer_score = 0
    @dealer_cards.each do |card|
      if card.rank.to_s == 'K' || card.rank.to_s == 'Q' || card.rank.to_s == 'J'|| card.rank.to_s == '10'
        @dealer_score += 10
      elsif card.rank.to_s =="A"
        if @dealer_score + 11 <= 21
          @dealer_score += 11
        else  
          @dealer_score += 1 
        end
      else  
        integer_score = card.rank.to_i 
        @dealer_score += integer_score
      end
    end 
    puts "The Dealers score is #{@dealer_score}"
  end

  def dealer_choice 
    if @dealer_score <= @player_score 
      @dealer_cards << @deck.deal
      add_dealer_score
      if @dealer_score > 21
        puts "you win, dealer bust"
        @wallet.amount += @player_bet 
        @wallet.amount += @player_bet 
        clear_game

      else  
        dealer_choice 
      end
    else   
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
      @player_cards <<@deck.deal
      add_player_score
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
    @wallet = wallet
    ask_for_bet
    puts "Your cards are:"
    deal_player_cards
    add_player_score
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
    deal_dealer_cards
    add_dealer_score
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~"
    player_choice 
    return @wallet
  end




end

# black = Blackjack.new
# black.deal_dealer_cards
# black.add_dealer_score

# ß
