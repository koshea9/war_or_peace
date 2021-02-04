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

#is this neccessary here or is this covered above? (not sure what the assertion would be)
  # def test_it_has_readable_attributes
  #   card1 = Card.new(:diamond, "Queen", 12)
  #   card2 = Card.new(:spade, "3", 3)
  #   card3 = Card.new(:heart, "Ace", 14)
  #
  #   cards = [card1, card2, card3]
  #   deck = Deck.new(cards)
  #   assert_equal 12, deck.cards
  # end

  def test_rank_at_index
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_can_pull_out_high_ranking_cards
  # skip
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_can_calculate_percent_high_cards
  # skip
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 66.7, deck.percent_high_ranking
  end
end
