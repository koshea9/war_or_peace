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
end
