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
    @cards = CardGenerator.new(filename).cards
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
    until game_over?
        play
    end
      else
      p "bye!"
    end
  end

  def play
    @play_counter += 1
    @turn.player1
    @turn.player2
    @turn.pile_cards
    @turn.type
    winner = @turn.winner
    @turn.award_spoils(winner)
    result_message
  end

  def game_over?
    @player1.has_lost? || @player2.has_lost? || @player_counter == 1000000
    game_over_message
  end

  def welcome_message
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are #{@player1} and #{@player2}."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
  end

  def result_message
  if @turn.type == :basic &&
   "Turn#{@play_counter}: #{@turn.winner.name} won 2 cards"
   elsif @turn.type == :war
    "Turn#{@play_counter}: WAR - #{@turn.winner.name} won 6 cards"
   elsif @turn.type == :mutually_assured_destruction
    "Turn#{@play_counter}: *mutually assured destruction* 6 cards removed from play"
   end
 end

  def game_over_message
    require "pry"; binding.pry
   if @player1.has_lost? == true
   "*~*~*~* #{@player2} has won the game! *~*~*~*"
   elsif @player2.has_lost? == true
  "*~*~*~* #{@player1} has won the game! *~*~*~*"
    end
  end
end


#
# def war_message
# if @type == :war && @turn.winner == @player1
#   "Turn#{@play_counter}: WAR - #{@turn.winner.name} won 6 cards"
# elsif @type == :war && @turn.winner == @player2
#   "Turn#{@play_counter}: WAR - #{@player2} won 6 cards"
#   end
# end
#
# def destruction_message
#   @type == :mutually_assured_destruction
#   "Turn#{@play_counter}: *mutually assured destruction* 6 cards removed from play"
# end
#
# def winner_message
#   if @player1.has_lost? == true
#     return "*~*~*~* #{@player2} has won the game! *~*~*~*"
#   elsif @player2.has_lost? == true
#       return "*~*~*~* #{@player1} has won the game! *~*~*~*"
#   end
# end
# end

# def result_message
#   if @turn.type == :basic && @turn.winner == @player1
#     return "Turn#{@play_counter}: #{@player1} won 2 cards"
#   elsif @type == :basic && @turn.winner == @player2
#       return "Turn#{@play_counter}: #{@player2} won 2 cards"
#     end
#   if @turn.type == :war && @turn.winner == @player1
#   "Turn#{@play_counter}: WAR - #{@turn.winner.name} won 6 cards"
#   elsif @type == :war && @turn.winner == @player2
#   "Turn#{@play_counter}: WAR - #{@player2} won 6 cards"
#   end
# end
#   if @player1.has_lost? == true
#     "*~*~*~* #{@player2} has won the game! *~*~*~*"
#   elsif @player2.has_lost? == true
#       "*~*~*~* #{@player1} has won the game! *~*~*~*"
#     end
#   if @type == :mutually_assured_destruction
#   "Turn#{@play_counter}: *mutually assured destruction* 6 cards removed from play"
#   end
