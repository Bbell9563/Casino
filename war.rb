require_relative 'deck'
require_relative 'card'
require_relative 'wallet'

class War
  def initialize
    @deck = Deck.new
    @dealer_cards = []
    @player_cards = []
    @player_score = 0
    @dealer_score = 0
    @wallet = Wallet.new(100)
  end 

  def deal_dealer_cards 
    puts 'Dealer drew:'
    @dealer_cards << @deck.deal
  end 

  def deal_player_cards 
    puts '#{user_name} drew:'
    @player_cards << @deck.deal 
  end 


  def add_dealer_score
    @dealer_score = 0
    @dealer_cards.each do |card|
      if card.rank.to_s == 'J' 
        @dealer_score += 11
      elsif card.rank.to_s == 'Q'
        @dealer_score += 12 
      elsif card.rank.to_s == 'K'
        @dealer_score += 13
      elsif card.rank.to_s == 'A'
        @dealer_score += 14 
      else  
        integer_score = card.rank.to_i 
        @dealer_score += integer_score
      end
    end 
  end

  def add_player_score  
    @player_score = 0
    @player_cards.each do |card|
      if card.rank.to_s == 'J' 
        @dealer_score += 11
      elsif card.rank.to_s == 'Q'
        @dealer_score += 12 
      elsif card.rank.to_s == 'K'
        @dealer_score += 13
      elsif card.rank.to_s == 'A'
        @dealer_score += 14 
      else  
        integer_score = card.rank.to_i 
        @player_score += integer_score
      end
    end 
  end 

  def war_intro 
    puts 'War is a simple game of chance. #{@user_name} and dealer will draw a card at the same time. If you have the higher card you win and $5.00 will be added to your balance. If dealer card is higher, you lose and $5.00 will be deducted.'
    puts '++++++++++++++++++++++++++++++++++++++++++'
  end 

  def war_app 
    war_intro
    play_war_game
  end 

  def play_war_game
    # @wallet = wallet 
    deal_dealer_cards
    deal_player_cards 
    winner
    puts '+++++++++++++++++++++++++++++++++'
    continue_play
  end 
 

  def winner 
    add_player_score
    add_dealer_score
    puts "+++++++++++++++++++++++++++++++++"
    if @dealer_score > @player_score 
      puts "Dealer Wins."
      puts "++++++++++++++++++++++++++++++++"
      @wallet.remove (5)
      puts "You have $#{@wallet.amount}.00"
    elsif @dealer_score < @player_score
      puts "You Win!"
      puts "+++++++++++++++++++++++++++++++"
      @wallet.add (5) 
      puts "You have $#{@wallet.amount}.00" 
    else @dealer_score == @player_score
      puts "Draw again to win the war"
      play_war_game
    end 
  end 

  def continue_play 
    puts '1) Play again'
    puts '2) Return to Menu'
    input = gets.to_i
    case 
    when 1 
      @player_cards.clear 
      @dealer_cards.clear 
      play_war_game
    when 2
     returns @wallet 
    else 
      puts "Invalid Choice"
    end 
  end 
end 

start = War.new
start.war_app  

