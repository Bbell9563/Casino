require_relative 'card'

class Deck 
  # Getter and Setter methods for rank, suit and color
  attr_accessor :cards
 
  # Gets called when you call the new method to create an instance
  # deck = Deck.new
  def initialize
    @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    @suits = %w(Spades Diamonds Clubs Hearts)
    @cards = []
    generate_deck
  end
 
  def shuffle_cards
   @cards.shuffle!
  end
  
  def generate_deck
    @suits.each do |suit|
      @ranks.size.times do |i|
        # Ternary Operator
        color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red' 
        @cards << Card.new(@ranks[i], suit, color)
      end
    end
    shuffle_cards
  end
 
  def display_cards
    @cards.each do |card|
      puts "#{card.rank} #{card.suit} (#{card.color})"
    end
  end
   
  def deal
    dealt = @cards.pop
    puts "#{dealt.rank} #{dealt.suit} (#{dealt.color})"
    return dealt 
  end

  def deal_card
    dealt = @cards.pop
    if dealt.rank =="10"
      if dealt.suit == 'Hearts'
        puts " 
         ___
        |#{dealt.rank} |
        | ♥︎ |
        |_#{dealt.rank}|"

      elsif dealt.suit == 'Spades'
        puts " 
         ___
        |#{dealt.rank} |
        | ♠ |
        |_#{dealt.rank}|
        "

      elsif dealt.suit == 'Diamonds'
        puts " 
         ___
        |#{dealt.rank} |
        | ♦ |
        |_#{dealt.rank}|"
      else  
        puts " 
         ___
        |#{dealt.rank} |
        | ♣ |
        |_#{dealt.rank}|"
      end

    else  
      if dealt.suit == 'Hearts'
        puts " 
         ___
        |#{dealt.rank}  |
        | ♥︎ |
        |__#{dealt.rank}|"

      elsif dealt.suit == 'Spades'
        puts " 
         ___
        |#{dealt.rank}  |
        | ♠ |
        |__#{dealt.rank}|
        "

      elsif dealt.suit == 'Diamonds'
        puts " 
         ___
        |#{dealt.rank}  |
        | ♦ |
        |__#{dealt.rank}|"
      else  
        puts " 
         ___
        |#{dealt.rank}  |
        | ♣ |
        |__#{dealt.rank}|"
      end
    end
    return dealt 
 end
end
  













 # Instantiate a new deck
# d = Deck.new
# d.deal(2) 