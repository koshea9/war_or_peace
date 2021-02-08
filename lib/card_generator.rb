require './lib/card'

class CardGenerator
attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    game_cards = File.readlines(@filename)

    game_cards.inject([]) do |all_cards, card|
       file_card = card.chomp.split(",")
       all_cards << Card.new(file_card[1].strip.downcase.to_sym, file_card[2].strip, file_card[0].strip.to_i)
    end
  end
end
