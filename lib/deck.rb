class Deck
attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  #take one arguement that represents the index of card to be used and will return the rank of that card
  def rank_of_card_at(index)
    @cards[index].rank
  end

  #return an array of cards in the deck that have a rank >=11 (face cards and aces)
  def high_ranking_cards
    high_ranking_cards = []
    cards.each do |card|
      high_ranking_cards << card.rank >= 11
    end
    high_ranking_cards
  end

  #return the percentage of cards that are high ranking
  def percent_high_ranking
  end

  #remove the top card from the deck
  def remove_card
  end

  #add one card to the bottom (end) of the deck
  def add_card
  end


end
