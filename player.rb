# Player class used to store name, and track number of cards
class Player
  def initialize(name)
    @name = name
    @n_of_cards = 0
  end

  def get_name
    return @name
  end

  def add_n_of_cards(n)
    @n_of_cards += n
  end

  def get_n_of_cards
    return @n_of_cards
  end
end