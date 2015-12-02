# Group Collaboration
# High or Low game
# welcome and explain rules of the game
# create a new deck of cards
# create a new player with a name and minimum bankroll
# pull a card out at random
# ask player high/low and how much they want to bet
# pull another random card
# if they win add double the bet amount to their bankroll
# if they lose subtract the bet amount from their bankroll
# ask them if they want to play again or cash out
# cash out - show them bankroll and thank them for their money

require "colorize"

class Card
  attr_accessor :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

class Player
  attr_accessor :name, :bankroll
  
  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
  end
end


def high_low
  #creates a new array of cards
  ranks = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
  suits = %w{Spades Hearts Diamonds Clubs}
  @stack_of_cards = suits.each_with_object([]) do |suit, res|
    ranks.size.times do |i|
      res << Card.new(ranks[i], suit)
    end
  end

  @rank_value = { 'A' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, 
    '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 11, 'Q' => 12, 'K' => 13 }

    puts `clear`
    puts "Welcome to the High Low game, #{@player_name}!".light_magenta
    puts "Bankroll = $#{@player_bankroll}".light_blue
    puts '**********************************************'.light_black
    puts 'The object of this game is to bet whether the next card drawn
            will be higher or lower than the current card.'.light_magenta
    puts ''
    puts ''
  
  def high_low_game

    initial_card = @stack_of_cards.sample

    initial_card_rank = initial_card.rank

    initial_card_value = @rank_value[initial_card_rank]

    print initial_card.rank.light_white, ' ',initial_card.suit.light_white
    puts ''
    puts ''
    puts 'Will the next card be higher or lower?'.light_magenta
    higher_lower = gets.strip.downcase
    puts 'How much would you like to bet?'.light_magenta
    player_bet = gets.to_i
    puts ''
    if player_bet > @player_bankroll
      puts "Homie can't play that game!".light_red
      puts "You only have #{@player_bankroll}, G".light_red
      puts "Let's just bet it all then dawg!!!!".light_green
      player_bet = @player_bankroll
    end

    next_card = @stack_of_cards.sample

    next_card_rank = next_card.rank

    next_card_value = @rank_value[next_card_rank]

    print initial_card.rank.light_white, ' ',initial_card.suit.light_white
    print ' vs '
    print next_card.rank.light_white, ' ', next_card.suit.light_white
    puts ''

    if higher_lower == "higher"
      if next_card_value > initial_card_value
          @player_bankroll += (player_bet * 2)
          puts ''
          puts "Congrats! You won $#{player_bet * 2}!".light_magenta
          puts "Your new bankroll is $#{@player_bankroll}!".light_green
          puts ''
        elsif next_card_value < initial_card_value
          @player_bankroll -= player_bet
          puts ''
          puts "Sorry, you lost $#{player_bet}!".light_red
          puts "Your new bankroll is $#{@player_bankroll}.".light_red   
          puts ''
        else next_card_value == initial_card_value
          puts ''
          puts "The cards are the same . . . draw again.".magenta
          puts ''
      end
    elsif higher_lower == "lower"
      if next_card_value < initial_card_value
          @player_bankroll += (player_bet * 2)
          puts ''
          puts "Congrats! You won $#{player_bet * 2}!".light_magenta
          puts "Your new bankroll is $#{@player_bankroll}!".light_green
          puts ''
        elsif next_card_value > initial_card_value
          @player_bankroll -= player_bet
          puts ''
          puts "Sorry, you lost $#{player_bet}!".light_red
          puts "Your new bankroll is $#{@player_bankroll}.".light_red
          puts ''
        else next_card_value == initial_card_value
          puts ''
          puts "The cards are the same . . . draw again.".magenta
          puts ''
      end
    end
    if @player_bankroll == 0
      puts "You're out money you loser".red
      puts 'Taking you to the main menu - type 3 to add more money'.green
      sleep(5)
      game_menu
    end
  end
  
  while true
    high_low_game
    puts'Do you want to play again? (y/n)'.light_magenta
    again = gets.strip.downcase
    puts '********************************'
    puts ''
    if again == 'n'
      puts 'Would you like to play a different game? (y/n)'.light_green
      if gets.strip.downcase == 'y'
        game_menu
      else
        puts `clear`
        puts '***********************************'.light_black
        puts "Thank you for playing! Come again!".red
        puts '***********************************'.light_black
        exit 0
      end
    end
  end

  # if higher_lower == 'higher'
  # else
  # end
end


# Slots game
# welcome and explain rules of the game
# create three arrays
# create a new player with a name and minimum bankroll
# ask player how much they want to bet
# pull the handle - pull a number at random out of each array and display it
# if they win (two or three alike) add double if two and triple if three to their bankroll
# if they lose subtract the bet amount from their bankroll
# ask them if they want to play again or cash out
# cash out - show them bankroll and thank them for their money

def slot_game
  def welcome_slots
    puts `clear`
    puts "Welcome to slots, #{@player_name}".light_cyan
    puts "Bankroll = $#{@player_bankroll}".light_blue
    puts '************************************************************'.light_black
    puts 'The object of this game is to bet on two or three of a kind.'.light_cyan
    puts ''
    puts ''
  end

  @arr_1 = %w[1 2 3 4 5 6 7 8 9]
  @arr_2 = %w[1 2 3 4 5 6 7 8 9]
  @arr_3 = %w[1 2 3 4 5 6 7 8 9]


  welcome_slots
  



  def barrels
    puts 'How much would you like to bet?'.light_cyan
    @player_bet = gets.to_i
    puts ''
    puts "Your bet is $#{@player_bet}.".light_blue
    puts ''
    if @player_bet > @player_bankroll
      puts "You currently have #{@player_bankroll}, let's bet it all then!".light_red
      @player_bet = @player_bankroll
    end

    one_barrel = @arr_1.sample
    two_barrel = @arr_2.sample
    three_barrel = @arr_3.sample

    print one_barrel.light_cyan
    sleep(0.5)
    print " ", two_barrel.light_cyan
    sleep(0.5)
    print " ", three_barrel.light_cyan, "\n\n"

    if one_barrel == two_barrel && one_barrel == three_barrel
      @player_bankroll += (@player_bet * 3)
      puts "all three match . . . your new bankroll is $#{@player_bankroll}".green
    elsif one_barrel == two_barrel || two_barrel == three_barrel || one_barrel == three_barrel
      @player_bankroll += (@player_bet * 2)
      puts "two of them match . . . your new bankroll is $#{@player_bankroll}".light_green
    else 
      @player_bankroll = @player_bankroll - @player_bet
      puts "nothing matches . . . you lost, your new bankroll is $#{@player_bankroll}".light_red 
    end
    puts ''

  end

  while true
    barrels
    if @player_bankroll == 0
      puts "You're out money you loser".red
      puts 'Taking you to the main menu - type 3 to add more money'.green
      sleep(5)
      game_menu
    end
    puts'Do you want to pull again? (y/n)'.light_cyan
    again = gets.strip.downcase
    if again == 'n'
      puts 'Would you like to play a different game? (y/n)'.light_green
      if gets.strip.downcase == 'y'
        game_menu
      else
        puts `clear`
        puts '***********************************'.light_black
        puts "Thank you for playing! Come again!".red
        puts '***********************************'.light_black
        exit 0
      end
    end
  end
end

def game_menu
  puts `clear`
  puts "Hey, #{@player_name}!".light_blue
  puts "Bankroll = $#{@player_bankroll}".light_blue
  puts 'Please, choose your game:'.light_green
  puts '****************************'.light_black
  puts '1. High Low'.light_magenta
  puts '2. Slots'.light_cyan
  puts '3. Add to your bankroll'.light_green
  puts '4. Cashout (exit)'.green
  game_choice = gets.to_i
  if game_choice == 1
    high_low
  elsif game_choice == 2
    slot_game
  elsif game_choice == 3
    puts "Great, how much would you like to add?".light_green
        @player_bankroll += gets.to_i
        game_menu
  elsif game_choice == 4
    puts `clear`
    puts "Thanks for playing!".red
    puts ''
    exit 0
  else
    puts "That's not an option, silly - pick from the menu".red
    game_menu
  end
  puts ''
  puts ''
end

def welcome_casino
  puts `clear`
  puts "Welcome to our casino!".red
  puts '-------------------------------'.light_black
  puts 'What is your name?'.light_green
  @player_name = gets.strip.downcase.capitalize
  puts 'What is your bankroll?'.light_green
  @player_bankroll = gets.to_i
  player_1 = Player.new(@player_name, @player_bankroll)
  game_menu
end

welcome_casino
game_menu




