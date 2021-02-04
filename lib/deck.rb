class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    @cards[index].rank
  end

  def high_ranking_cards
    high_cards = []
    @cards.each do |card|
      if card.rank > 10
        high_cards << card
      end
    end
    high_cards
  end

  def count_high_cards
    high_ranking_cards.count.to_f
  end

#count of high/count of total * 100
  def percent_high_ranking
    (count_high_cards/cards.count).round(3) * 100
  end
end
