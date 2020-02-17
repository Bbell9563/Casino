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
  end 

  def war_app 
    war_intro
    shuffle_cards 
    dealer_cards
    player_cards 
    winner
    continue_play
  end 
 

  def war_intro 
    puts 'War is a simple game of chance. #{@user_name} you will be dealt half the deck, 26 cards. You will draw your top card face up at the same time as the dealer. If you have the higher card you win that draw and takes both the cards. If not you lose.'
    puts "++++++++++++++++++++++++++++++++++++++++++++++"
    puts " #{@user_name}. This means war!"
  end 

  def dealer_cards 
    @dealer_cards << @deck.deal
  end 

  def player_cards 
    @player_cards << @deck.deal 
  end 

  def winner 
    if @dealer_cards.deck > @player_cards.deck  
      puts "Dealer Wins"
    elsif @dealer_cards < @player_cards 
      puts " #{user_name} Wins"
    else @dealer_cards == @player_cards
      puts "Draw again to win the war"
      card_draw
       if @dealer_cards > @player_cards 
        puts "Dealer Wins"
      elsif @dealer_cards < @player_cards 
        puts " #{user_name} Wins"
      end 
    end 

  def continue_play 
    puts '1) PLay again'
    puts '2) Cash out'
    puts '3) Play another game'
    input = gets.to_i
  case choice 
  when 1 
    card_draw 
  when 2
    #wallet cash out 
  when 3 
    menu_games 
  end 
end 

start = War.new
puts start  
