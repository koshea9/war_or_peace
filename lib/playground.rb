
if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
  player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
  :mutually_assured_destruction
elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
  :war
