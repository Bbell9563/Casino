require_relative 'deck'
require_relative 'card'

class War
  def initialize
    @deck = Deck.new
    @dealer_cards = []
    @player_cards = []
    @player_score = []
    @dealer_score = []
    war_intro 
    dealer_cards 
    player_cards
    card_draw
    winner 
  end 

  def war_intro 
    puts 'War is a simple game of chance. #{@user_name} you will be dealt half the deck, 26 cards. You will draw your top card face up at the same time as the dealer. If you have the higher card you win that draw and takes both the cards. If not you lose.'
    puts "++++++++++++++++++++++++++++++++++++++++++++++"
    puts " #{@user_name}. This means war!"
  end 

  def dealer_cards 
    @dealer_cards << @deck[rand(@deck.length/26)]
  end 

  def player_cards 
    @player_cards << @deck[rand(@deck.length/26)]
  end 

  def card_draw 
    puts "Draw"
    @dealer_cards.first 
    @player_cards.first 
  end 

  def winner 
    if @dealer_cards > @player_cards 
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
  end 

end 

War.new 
