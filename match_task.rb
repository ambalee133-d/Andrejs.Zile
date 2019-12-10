require_relative 'card_stack'
require_relative 'player'

# Main class using which the game can be started
class MatchTask
  def initialize
    play
  end

  def play
    card_stack, condition = get_user_input

    # initializing players and variables
    player_one = Player.new(1)
    player_two = Player.new(2)
    previous_card = nil
    cards_put_away = 0
    current_player = player_one

    # getting through the stack of cards
    while card_stack.size > 0
      current_card = card_stack.top_card
      cards_put_away += 1
      if previous_card && card_matched?(previous_card, current_card, condition)
        current_player.add_n_of_cards(cards_put_away)
        cards_put_away = 0
      end

      if current_player == player_two
        current_player = player_one
      else
        current_player = player_two
      end
      previous_card = current_card
    end

    # Outputting result
    if player_one.get_n_of_cards == player_two.get_n_of_cards
      puts "Draw!"
    elsif player_one.get_n_of_cards > player_two.get_n_of_cards
      puts "Player #{player_one.get_name} wins"
    elsif player_two.get_n_of_cards > player_one.get_n_of_cards
      puts "Player #{player_two.get_name} wins"
    end

  end

  # Method to get all user input
  def get_user_input
    waiting_for_input = true
    card_stack = nil
    condition = 0

    while waiting_for_input
      puts "How many packs of cards to use?"
      n_of_packs = gets.chomp.to_i
      if n_of_packs < 1
        puts "Number of packs must be at least 1"
        next
      end

      puts "which of the three matching conditions to use
       - [1] face value of card
       - [2] the suit
       - [3] both"
      condition = gets.chomp.to_i

      if condition < 1 || condition > 3
        puts "condition must be 1 to 3"
        next
      end

      card_stack = CardStack.new(n_of_packs)
      card_stack.shuffle
      waiting_for_input = false
    end

    return card_stack, condition
  end

  # Helper method to compare cards using the method from user input
  def card_matched?(card_1, card_2, method)
    case method
    when 1 # Face value of the card
      return true if card_1 - (card_1 / 100 * 100) == card_2 - (card_2 / 100 * 100)
      return false
    when 2 # The suit of the card
      return true if card_1 / 100 == card_2 / 100
      return false
    when 3 # Using both of the above
      return true if card_1 == card_2
      return false
    else
      return false
    end
  end

end