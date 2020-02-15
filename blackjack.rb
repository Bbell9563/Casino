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
    @player_cards << @deck.deal(2)
  end

  def deal_dealer_cards
    @deck.deal(2)
  end

  def add_player_score
    @player_cards.each do |card|
      first_char = card.to_s[3]
      puts card.display_card

    end 

  end


end

black = Blackjack.new
black.deal_player_cards
black.add_player_score