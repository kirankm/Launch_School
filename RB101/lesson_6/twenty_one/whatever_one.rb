require "yaml"

# rubocop:disable Security/YAMLLoad
############################# Constants #################################
LANGUAGE = "en"
CONFIG_MSG = YAML.load(File.read("whatever_one_config.yml"))
CONFIG_OPT = YAML.load(File.read("whatever_one_option.yml"))

# rubocop:enable Security/YAMLLoad
############################ Helper Functions ##########################
def prompt(*msg)
  puts "==> #{msg.join(' ')}"
end

def clear_screen
  system("clear") || system("cls")
end

def get_message(msg, lang = "en")
  CONFIG_MSG[lang][msg]
end

def joinand(arr, sep = ", ", connector = "and")
  out_arr = arr.clone
  out_arr[-1] = connector + " " + out_arr[-1].to_s if arr.length > 1
  sep = " " if arr.length == 2
  out_arr.join(sep)
end

def print_blank
  puts "\n"
end

def greet
  clear_screen
  prompt "Hi, #{NAME.capitalize}"
  prompt(get_message(:welcome))
end

def yes?(response)
  response == "y" || response == "yes"
end

################################### Game Functions #############################
def initialize_game
  game = {}
  game[:winner_cutoff] = CONFIG_OPT[:winner_cutoff]
  game[:card_values] = generate_card_value_map
  game[:max_points] = CONFIG_OPT[:max_points]
  game[:min_points_dealer] = CONFIG_OPT[:min_points_dealer]
  game[:round_no] = 1
  game[:quit_game] = false
  game[:score] = new_score
  game[:grand_winner] = nil
  game[:current_round_winner] = nil
  game[:changable_setting] = [:max_points, :min_points_dealer, :winner_cutoff]
  game
end

def generate_card_value_map
  {
    "ace": [1, 11], "two": [2], "three": [3], "four": [4], "five": [5],
    "six": [6], "seven": [7], "eight": [8], "nine": [9], "ten": [10],
    "jack": [10], "queen": [10], "king": [10]
  }
end

def new_score
  score = {}
  score[NAME.capitalize] = 0
  score["Dealer"] = 0
  score
end

def stop_game?(game)
  game[:quit_game]
end

def update_winner(game, winner)
  score = game[:score]
  game[:current_round_winner] = winner
  score[winner] += 1
  game[:grand_winner] = winner if score[winner] == game[:winner_cutoff]
end

def display_score(game)
  score = game[:score]
  prompt("Current Score is ", score.to_a.map { |x| x.join(" => ") }.join(" | "))
end

def display_congrats_grand_winner(game)
  grand_winner = game[:grand_winner]
  prompt(get_message(:grand_winner), grand_winner.upcase)
  print_blank
end

def display_start_message(game)
  clear_screen
  if game[:round_no] == 1
    prompt(get_message(:new_tournament))
    prompt "Win #{game[:winner_cutoff]} Rounds to be The Grand Winner"
  end

  prompt "Round #{game[:round_no]}"

  print_blank
  sleep 2
end

def quit_game(game)
  game[:quit_game] = true
end

def continue_game(game, deck)
  shuffle_deck!(deck)
  start_new_round(game) unless game[:grand_winner]
  start_new_game(game) if game[:grand_winner]
end

def start_new_round(game)
  game[:round_no] += 1
  game[:current_round_winner] = nil
end

def start_new_game(game)
  game[:round_no] = 1
  game[:score] = new_score
  game[:grand_winner] = nil
  game[:current_round_winner] = nil
end

################################ Deck Functions ###########################
def initialize_deck(game)
  card_names = game[:card_values].keys
  all_cards = create_deck(card_names)

  deck = {}
  deck[:next_card_index] = 0
  deck[:cards] = all_cards
  shuffle_deck!(deck)
  deck
end

def shuffle_deck!(deck)
  deck[:next_card_index] = 0
  deck[:cards].shuffle!
end

def create_card(name, suit)
  card = Hash.new
  card["name"] = name
  card["suit"] = suit
  card
end

def create_deck(card_names)
  suits = ["Spades", "Hearts", "Diamonds", "Clubs"]
  all_combinations = card_names.product(suits)
  all_combinations.map { |name, suit| create_card(name, suit) }
end

def deal_next_card!(deck_hash)
  next_card_index = deck_hash[:next_card_index]
  next_card = deck_hash[:cards][next_card_index]
  deck_hash[:next_card_index] += 1
  next_card
end

def get_card_current_value(card, player, game)
  current_points = player[:points]
  possible_values = get_card_all_values(card, game)
  points_to_maximum = game[:max_points] - current_points
  card_value =
    possible_values.select { |value| value <= points_to_maximum }.max
  card_value.nil? ? possible_values[0] : card_value
end

def show_card_info(player, card, card_value)
  card_name = get_card_name(card)
  prompt "#{player[:name]} was dealt #{card_name} with value #{card_value}"
  sleep(2)
end

def get_card_name(card)
  "#{card['name'].capitalize} of #{card['suit'].capitalize}"
end

def get_card_all_values(card, game)
  card_name = card["name"]
  game[:card_values][card_name.to_sym]
end

################################ Player Functions #########################
def initialize_player(name)
  player = Hash.new
  player[:cards] = []
  player[:points] = 0
  player[:name] = name.capitalize
  player[:state] = "active"
  player
end

def deal_card_to_player(player, deck, game, show_card)
  card = deal_next_card!(deck)
  add_card_to_user_deck!(player, card, game, show_card)
end

def add_card_to_user_deck!(player, card, game, show_card)
  card_value = get_card_current_value(card, player, game)
  show_card_info(player, card, card_value) if show_card
  player[:cards] << card
  player[:points] += card_value
  player
end

def player_active?(player)
  player[:state] == "active"
end

def display_hand(player, first_only = false)
  name = player[:name]
  prompt "#{name}'s hand is #{get_hand(player, first_only)}"
end

def display_points(player)
  name = player[:name]
  prompt "#{name}'s total points is #{player[:points]}"
  prompt "#{name} has busted" if busted?(player)
end

def get_hand(player, first_only)
  card_list = []
  player[:cards].each_with_index do |card, index|
    card = (index > 0) && first_only ? "?" : get_card_name(card)
    card_list << card
  end
  joinand(card_list)
end

def player_stays(player)
  prompt "#{player[:name]} stays."
  set_state!(player, "stayed")
end

def update_player_score!(player, game)
  if player_above_threshold?(player, game[:max_points])
    update_player_points!(player, game)
    player_busts(player) if player_above_threshold?(player, game[:max_points])
  end
end

def max_points?(player, game)
  player[:points] == game[:max_points]
end

def player_above_threshold?(player, threshold)
  player[:points] > threshold
end

def busted?(player)
  player[:state] == "busted"
end

def player_busts(player)
  prompt "#{player[:name]} has busted."
  sleep 2
  set_state!(player, "busted")
end

def set_state!(player, new_state)
  player[:state] = new_state
  sleep(2)
  clear_screen
end

def update_player_points!(player, game)
  player[:points] = 0
  player[:cards].each do |card|
    card_value = get_card_current_value(card, player, game)
    player[:points] += card_value if card["name"].to_s != "ace"
  end

  player[:cards].each do |card|
    card_value = get_card_current_value(card, player, game)
    player[:points] += card_value if card["name"].to_s == "ace"
  end
end

############################ User Response Functions ######################
def continue?(game)
  if game[:grand_winner]
    input_msg = get_message(:continue_grand_winner)
  else
    prompt(get_message(:winner_cutoff), game[:winner_cutoff].to_s)
    input_msg = get_message(:continue)
  end
  get_object_from_user(input_msg, :valid_yes_no_reponse?, input_msg).downcase
end

def stay_or_hit?
  input_msg = get_message(:user_action)
  valid_msg = get_message(:user_action_valid)
  get_object_from_user(input_msg, :valid_action_choice?, valid_msg).downcase
end

def valid_action_choice?(response)
  ["stay", "s", "hit", "h"].include? response.downcase
end

def get_new_value(setting, game)
  clear_screen
  curr_value = game[setting]
  prompt "Please enter the new value for #{setting}"
  prompt get_setting_msg(setting)

  prompt "Current value is #{curr_value}"
  response = gets.chomp
  until valid_setting_value?(response, setting)
    prompt "Please enter a valid value within the given range"
    response = gets.chomp
  end
  response.to_i
end

def valid_setting_value?(response, setting)
  setting_range_key = setting.to_s + "_range"
  value_range = CONFIG_OPT[setting_range_key.to_sym]
  (response.to_i.to_s == response) & (response.to_i.between?(*value_range))
end

def change_settings?
  prompt get_message(:change_settings_intro)
  msg = get_message(:change_settings_repeat)
  get_object_from_user(msg, :valid_yes_no_reponse?, msg).downcase
end

def valid_yes_no_reponse?(response)
  ["yes", "y", "no", "n"].include? response.downcase
end

def user_name
  clear_screen
  input_msg = get_message(:get_name)
  valid_msg = get_message(:valid_name)
  get_object_from_user(input_msg, :valid_name?, valid_msg)
end

def valid_name?(name)
  (name.to_i == 0) && (name.length > 0) && (name.upcase != name.downcase)
end

def get_object_from_user(input_msg, valid_fun, valid_msg)
  return_val = get_user_response(input_msg)
  until method(valid_fun).call(return_val)
    return_val = get_user_response(valid_msg)
  end
  return_val
end

def get_user_response(msg)
  prompt msg
  gets.chomp
end

################################### Update Setting Functions #############
def finalize_settings!(game)
  greet
  change_setting_response = change_settings?
  update_game_settings!(game) if yes? change_setting_response
  show_game_settings(game)
end

def update_game_settings!(game)
  game[:changable_setting].each do |setting|
    game[setting] = get_new_value(setting, game)
  end
end

def show_game_settings(game)
  clear_screen
  prompt get_message(:setting_display)
  game[:changable_setting].each do |setting|
    prompt "Value for #{setting} is #{game[setting]}"
  end
  gets.chomp
end

def get_setting_msg(setting)
  msg_key = setting.to_s + "_help"
  get_message(msg_key.to_sym)
end

################################ Main Loop other Functions ################
def deal_starting_hand(deck, user, dealer, game)
  prompt "Both Players are dealt 2 cards"
  2.times do
    deal_card_to_player(user, deck, game, true)
    deal_card_to_player(dealer, deck, game, false)
  end
  sleep 2
end

def diplay_visible_card_info(user, dealer)
  clear_screen
  prompt "#{user[:name]}'s Turn"
  display_hand(user, false)
  prompt "#{user[:name]}'s Hand Value is #{user[:points]}"
  print_blank
  display_hand(dealer, true)
  print_blank
end

def stay?(action_response)
  action_response == "stay" || action_response == "s"
end

def display_all_hands(user, dealer)
  clear_screen
  display_hand(user)
  display_points(user)
  print_blank
  display_hand(dealer)
  display_points(dealer)
end

def display_updated_result(user, dealer, game)
  print_blank
  winner = get_winner(user, dealer)
  winner = winner[:name] if winner
  update_winner(game, winner) if winner
  prompt winner.nil? ? "It's a Tie" : "#{winner} wins"
  display_score(game)
  display_congrats_grand_winner(game) if game[:grand_winner]
  print_blank
end

def get_winner(user, dealer)
  return dealer if busted?(user)
  return user if busted?(dealer)
  return user if user[:points] > dealer[:points]
  return dealer if user[:points] < dealer[:points]
  nil
end

def user_turn(user, dealer, deck, game)
  while player_active?(user)
    diplay_visible_card_info(user, dealer)
    if max_points?(user, game)
      player_stays(user)
    else
      user_action_response = stay_or_hit?
      if stay? user_action_response
        player_stays(user)
      else
        deal_card_to_player(user, deck, game, true)
        update_player_score!(user, game)
      end
    end
  end
end

def dealer_turn(dealer, user, deck, game)
  if busted?(user)
    set_state!(dealer, "winner")
  else
    prompt "Dealers Turn"
  end
  while player_active?(dealer)
    if player_above_threshold?(dealer, game[:min_points_dealer] - 1)
      player_stays(dealer)
    else
      deal_card_to_player(dealer, deck, game, true)
      update_player_score!(dealer, game)
    end
  end
end

################################### Main Loop ##############################
NAME = user_name
game = initialize_game
finalize_settings!(game)

until stop_game?(game)
  display_start_message(game)
  deck = initialize_deck(game)
  user = initialize_player(NAME)
  dealer = initialize_player("dealer")
  deal_starting_hand(deck, user, dealer, game)

  user_turn(user, dealer, deck, game)
  dealer_turn(dealer, user, deck, game)

  display_all_hands(user, dealer)
  display_updated_result(user, dealer, game)

  continue_game_response = continue?(game)
  yes?(continue_game_response) ? continue_game(game, deck) : quit_game(game)
end

prompt get_message(:thanks)
