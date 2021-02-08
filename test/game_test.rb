require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class GameTest < Minitest::Test
  def test_it_exists
    filename = "cards.txt"
    game = Game.new(filename)

    assert_instance_of Game, game
  end

  def test_it_can_play
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card3, card4, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    game = Game.new("cards.txt")

    game.play
    type = game.turn.type
    require "pry"; binding.pry

    assert_equal "Turn1: Megan won 2 cards", game.result_message(type)
  end

  def test_it_can_end_game
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    deck1 = Deck.new([card1, card2, card5])
    deck2 = Deck.new([card3, card4, card6])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    game = Game.new("cards.txt")

    1000.times do game.play
    end

    assert_equal true, game.game_over?
  end
end
