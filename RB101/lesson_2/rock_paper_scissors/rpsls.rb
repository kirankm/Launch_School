############################ Helper Functions ##########################
require "yaml"

def calculate_winner(player, computer)
  if win?(player, computer)
    "player"
  elsif win?(computer, player)
    "computer"
  else
    "tie"
  end
end

def update_score(score, winner)
  score[winner] += 1 if score.key? winner
end

def pp_score(score)
  score.to_a.map { |x| x.join(" => ") }.join(" | ")
end

def win?(first, second)
  WIN_HASH[first].include? second
end

def prompt(*msg)
  puts "==> #{msg.join(' ')}"
end

def get_message(msg, lang = "en")
  CONFIG[lang][msg]
end

def greet(name)
  prompt(get_message(:greet), name.capitalize)
end

def valid_name?(name)
  (name.to_i == 0) && (name.length > 0) && (name.upcase != name.downcase)
end

def current_leader(score, name)
  if score["player"] > score["computer"]
    name.upcase
  elsif score["player"] == score["computer"]
    "TIE"
  else
    "COMPUTER"
  end
end

def display_game_message(winner, loser, game_msg)
  out = game_msg.select do |sub_msg|
    msg = sub_msg.split(" ")
    msg[0] == winner && msg[-1] == loser
  end
  prompt out[0]
end

################################ Main Functions ################################
def clear_screen
  system("clear") || system("cls")
end

def display_welcome
  prompt(get_message(:welcome))
end

def get_name
  prompt(get_message(:get_name))
  name = gets.chomp()

  while !valid_name?(name)
    prompt(get_message(:valid_name))
    name = gets.chomp()
  end

  greet(name)
  name
end

def initialize
  score = Hash.new
  score["player"] = 0
  score["computer"] = 0
  score
end

def get_player_choice
  player_choice = "rock"

  loop do
    prompt(get_message(:player_choice), VALID_OPTIONS.join(', '))
    player_choice = Kernel.gets().chomp()
    player_choice = SHORT_FORM[player_choice] if SHORT_FORM[player_choice]

    break if VALID_OPTIONS.include? player_choice.downcase
    prompt(get_message(:valid_choice), VALID_OPTIONS.join(' or '))
  end
  player_choice.downcase
end

def get_computer_choice
  VALID_OPTIONS.sample
end

def display_result(player_choice, computer_choice, winner, game_msg, score)
  prompt "You chose: #{player_choice}; computer chose: #{computer_choice}"
  if winner == "computer"
    display_game_message(computer_choice, player_choice, game_msg)
    prompt("#{winner} won")
  elsif winner == "player"
    display_game_message(player_choice, computer_choice, game_msg)
    prompt("#{winner} won")
  else
    prompt "it's a tie"
  end
  prompt pp_score(score)
end

def get_continue_answer
  prompt(get_message(:winner_cutoff), WINNER_CUTOFF)
  prompt(get_message(:continue))
  response = gets.chomp.downcase
  while !["yes", "y", "no", "n"].include? response.downcase
    prompt(get_message(:continue))
    response = gets.chomp
  end
  response
end

def play_again?(response)
  response.downcase!
  response == "y" || response == "yes"
end

def display_bye(score, name)
  current_winner = current_leader(score, name)
  if grand_winner?(score)
    prompt(get_message(:grand_winner), current_winner)
  else
    sendoff = case current_winner
              when name.upcase
                get_message(:winner)
              when "COMPUTER"
                get_message(:loser)
              when "TIE"
                get_message(:tie)
              end
    prompt(sendoff, name.capitalize)
  end

  prompt(get_message(:thanks), VALID_OPTIONS.join(' ').upcase)
end

def grand_winner?(score)
  score.values.max >= WINNER_CUTOFF
end

############################# Constants #################################
VALID_OPTIONS = %w(rock paper scissors lizard spock)
LANGUAGE = "en"
CONFIG = YAML.load(File.read("rps_config.yml"))

SHORT_FORM = { "s" => "scissors",
               "p" => "paper",
               "r" => "rock",
               "l" => "lizard",
               "sp" => "spock" }

WIN_HASH = { "spock" => ["rock", "scissors"],
             "lizard" => ["spock", "paper"],
             "rock" => ["scissors", "lizard"],
             "paper" => ["rock", "spock"],
             "scissors" => ["paper", "lizard"] }

WINNER_CUTOFF = 5

########################### Main Code #####################################
clear_screen()

display_welcome()
name = get_name
game_msg = get_message(:game_message).split(".").map(&:downcase)

score = initialize

loop do
  player_choice = get_player_choice
  computer_choice = get_computer_choice

  winner = calculate_winner(player_choice, computer_choice)
  update_score(score, winner)
  display_result(player_choice, computer_choice, winner, game_msg, score)

  break if grand_winner?(score)
  response = get_continue_answer
  break unless play_again?(response)
end

display_bye(score, name)
