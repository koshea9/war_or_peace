require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck.rb'
require './lib/card'
require './lib/player'

class DeckTest < Minitest::Test
  def test_it_exists

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
    assert_equal "Clarisa", player.name
  end

  def test_it_has_readable_attributes

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    assert_equal "Clarisa", player.name
  end

  def test_if_player_has_card_will_not_lose

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    assert_equal false, player.has_lost?
  end

  def test_player_can_remove_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    assert_equal card1, player.deck.remove_card
  end

  def test_if_player_0_card_will_lose

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)
    player.deck.remove_card
    player.deck.remove_card
    player.deck.remove_card

    assert_equal true, player.has_lost?
  end
end
