require './lib/card'
require './lib/card_generator'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
attr_reader :player1,
            :player2,
            :cards,
            :deck1,
            :deck2,
            :turn

  def initialize(filename)
    @cards = CardGenerator.new(filename).cards.shuffle
    @deck1 = Deck.new(@cards[0..24])
    @deck2 = Deck.new(@cards[25..51])
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
    @turn = Turn.new(@player1, @player2)
    @play_counter = 0
  end

  def start
    welcome_message
    start_input = gets.chomp.upcase
    if start_input == "GO"
      until game_over? == true
      play
    end
      else
      p "bye!"
    end
  end

  def play
    @play_counter += 1
    @turn
    type = @turn.type
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)
    p result_message(type)
  end

  def game_over?
    @player1.has_lost? || @player2.has_lost? || @play_counter == 1000000
  end

  def welcome_message
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are #{@player1} and #{@player2}."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
  end

  def result_message(type)
  if type == :basic
   "Turn#{@play_counter}: #{@turn.winner.name} won 2 cards"
 elsif type == :war
   "Turn#{@play_counter}: WAR - #{@turn.winner.name} won 6 cards"
 elsif type == :mutually_assured_destruction
   "Turn#{@play_counter}: *mutually assured destruction* 6 cards removed from play"
   end
 end

  def game_over_message
   if @player1.has_lost?
   p "*~*~*~* #{@player2} has won the game! *~*~*~*"
    elsif @player2.has_lost?
   p "*~*~*~* #{@player1} has won the game! *~*~*~*"
    end
  end
end
