require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck.rb'
require './lib/card'

class DeckTest < Minitest::Test
  def test_it_exists
    card = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new(card)
    assert_instance_of Deck, deck
  end

  def test_rank_at_index
    card1 = Card.new(:diamond, "Queen", 23)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    deck.rank_of_card_at(0)

    assert_equal 12, 12
  end
end
