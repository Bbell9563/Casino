require_relative 'deck'
require_relative 'card'
# require_relative 'app'

class Blackjack 
  def initialize
    @deck = Deck.new
    @player_cards = []
    @dealer_cards = []
    @player_score = []
    @dealer_score = []

  end

  def deal_player_cards
    @player_cards << @deck.deal
    @player_cards << @deck.deal
    

  end

  def deal_dealer_cards
    @dealer_score <<@deck.deal
    @dealer_score <<@deck.deal
  end

  def add_player_score
    @player_cards.each do |card|
      if card.rank.to_s == 'A'
        puts "there is an A"
      end
      

     

    end 

  end


end

black = Blackjack.new
black.deal_player_cards
black.add_player_score