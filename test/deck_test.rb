require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck.rb'
require './lib/card'
require './lib/player'

class DeckTest < Minitest::Test
  def test_it_exists
    card = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new(card)

    assert_instance_of Deck, deck
  end

  def test_rank_at_index
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_can_ID_high_ranking_cards
  # skip
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_can_ID_high_ranking_cards_after_removal
  # skip
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card

    assert_equal [card3], deck.high_ranking_cards
  end

  def test_can_calculate_percent_high_cards
  # skip
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_can_remove_card
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal card1, deck.remove_card
  end

  def test_calculates_percentage_after_removal
  # skip
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    deck.remove_card

    assert_equal 50.0, deck.percent_high_ranking
  end

  def test_can_add_card
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, "3", 3)
    card3 = Card.new(:heart, "Ace", 14)
    card4 = Card.new(:club, '5', 5)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    assert_equal [card1, card2, card3, card4], deck.add_card(card4)
  end
end
