class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    return :basic if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
    return :war if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
  end

  def winner
    if :basic
    @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    else
      @player2
    end
  end

  def pile_cards
    if :basic
    @spoils_of_war << @player1.deck.cards[0]
      @player1.deck.remove_card
    @spoils_of_war << @player2.deck.cards[0]
     @player2.deck.remove_card
    else
      :war
    end
  end

  def award_spoils(winner)
    @spoils_of_war.map do |card|
      winner.deck.add_card(card)
    end
    @spoils_of_war = []
  end
end
