# Card Stack class used to generate the cards array, and also additional methods to get top card, shuffle and check the size of stack.
class CardStack
  def initialize(n_of_packs)
    @stack = Array.new(52) {|x| (x / 13 + 1) * 100 + (x % 13) + 1}
    @stack = @stack * n_of_packs
  end

  def shuffle
    @stack = @stack.shuffle
  end

  def top_card
    return @stack.pop
  end

  def get_array
    return @stack
  end

  def size
    return @stack.length
  end
end