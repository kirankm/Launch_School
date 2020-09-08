require "yaml"
require "pry"
require "pry-byebug"
############################# Constants #################################
LANGUAGE = "en"
CONFIG_MSG = YAML.load(File.read("ttt_config.yml"))
CONFIG_OPT_PATH = "ttt_option.yml"

############################ Helper Functions ##########################
def prompt(message)
  Kernel.puts("==> #{message}")
end

def prompt(*msg)
  puts "==> #{msg.join(' ')}"
end

def clear_screen
  system("clear") || system("cls")
end

def get_message(msg, lang = "en")
  CONFIG_MSG[lang][msg]
end

def greet(name)
  prompt(get_message(:greet), name.capitalize)
end

def valid_name?(name)
  (name.to_i == 0) && (name.length > 0) && (name.upcase != name.downcase)
end

def get_object_from_user(input_msg, valid_fun = nil, valid_message = nil)
  prompt(input_msg)
  return_val = gets.chomp

  while valid_fun && !method(valid_fun).call(return_val)
    prompt(valid_message)
    return_val = gets.chomp
  end
  return_val
end

def joinor(arr, sep = ", ", connector = "or")
  out_arr = arr.clone
  out_arr[-1] = connector + " " + out_arr[-1].to_s if arr.length > 1
  sep = " " if arr.length == 2
  out_arr.join(sep)
end

def current_leader(score, name)
  if score["user"] > score["computer"]
    name.upcase
  elsif score["user"] == score["computer"]
    "TIE"
  else
    "COMPUTER"
  end
end

############################# Main Functions #############################
############################# Initial Screen #############################

def get_name
  name_input_msg = get_message(:get_name)
  name_invalid_msg = get_message(:valid_name)
  get_object_from_user(name_input_msg, :valid_name?, name_invalid_msg)
end

### Initializing
def display_welcome
  prompt(get_message(:welcome))
end

def greet(name)
  prompt(get_message(:greet), name)
end

def valid_option?(value)
  (value.to_i.to_s == value) && (%w(1 2 3).include? value)
end

def get_option(name)
  greet(name)
  option_input_msg = get_message(:choose_option)
  option_invalid_msg = get_message(:valid_option)
  get_object_from_user(option_input_msg, :valid_option?, option_invalid_msg).to_i
end

#################################### Initialize Game Setup#################
def setup_initial_board
  Array.new(3) { Array.new(3) { MARKER["initial"] } }
end

def get_marker_key(marker_setting_key)
  marker_setting_key.to_s.split("_")[-1]
end

def get_game_settings
  board_parameters = {}
  game_parameters = {}
  marker = {}

  config_opt = YAML.load(File.read(CONFIG_OPT_PATH))
  board_keys = [:row_separator, :col_separator, :intersection_marker,
    :col_width, :row_height]
  marker_keys = [:marker_user, :marker_computer, :marker_initial]

  board_keys.each { |key| board_parameters[key] = config_opt[key]}
  marker_keys.each { |key| marker[get_marker_key(key)] = config_opt[key] }

  config_opt.keys.each do |key|
    game_parameters[key] = config_opt[key] unless (marker_keys.include? key) && 
                                                  (board_keys.include? key)
  end
  [board_parameters, game_parameters, marker]
end

def new_score
  score = Hash.new
  score["user"] = 0
  score["computer"] = 0
  score
end

def pp_score(score)
  prompt("Current Score is ",score.to_a.map { |x| x.join(" => ") }.join(" | "))
end


####################################### Display_Board ##########################

def display_board(board)
  #clear_screen
  row_separator = BOARD_PARAMETERS[:row_separator]
  col_separator = BOARD_PARAMETERS[:col_separator]
  int_marker = BOARD_PARAMETERS[:intersection_marker]
  col_width = BOARD_PARAMETERS[:col_width]
  row_height = BOARD_PARAMETERS[:row_height]

  empty_row = create_empty_row(col_separator, col_width)
  separator_row = create_sepator_row(row_separator, int_marker, col_width)

  row_counter = 0
  loop do
    display_board_row(empty_row, board[row_counter], col_separator,
                      row_height, col_width)
    row_counter += 1
    break if row_counter == 3
    prompt separator_row
  end
end

def display_board_row(empty_row, row, col_separator, row_height, col_width)
  ((row_height - 1) / 2).times { prompt empty_row }
  prompt create_value_row(row, col_separator, col_width)
  ((row_height - 1) / 2).times { prompt empty_row }
end

def create_sepator_row(row_separator, int_marker, col_width)
  separator_cell = create_separator_cell(row_separator, col_width)
  separator_cell + int_marker + separator_cell + int_marker + separator_cell
end

def create_separator_cell(row_separator, col_width)
  row_separator * col_width
end

def create_empty_row(col_separator, col_width)
  empty_cell = " " * col_width
  empty_cell + col_separator + empty_cell + col_separator + empty_cell
end

def create_value_row(board_row, col_separator, col_width)
  cell0 = create_value_cell(board_row[0], col_width)
  cell1 = create_value_cell(board_row[1], col_width)
  cell2 = create_value_cell(board_row[2], col_width)
  cell0 + col_separator + cell1 + col_separator + cell2
end

def create_value_cell(value, col_width)
  half_width = (col_width - 1) / 2
  " " * half_width + value.to_s + " " * half_width
end
############################# GamePlay - Move #############################
def get_empty_squares(board)
  empty_squares = []
  board.each_with_index do |row, row_index|
    row.each_with_index do |cell, col_index| 
      empty_squares << (3 * row_index + col_index + 1)  if cell == MARKER["initial"]
    end
  end
  return empty_squares
end

def valid_square?(empty_squares, square)
    (empty_squares.include? square.to_i) && (square.to_i.to_s == square)
end

def get_user_move(empty_squares)
  prompt(get_message(:user_move), joinor(empty_squares))
  user_square = gets.chomp
  until valid_square?(empty_squares, user_square)
    if user_square.to_i.to_s != user_square
      prompt get_message(:invalid_out_of_bounds)
    elsif user_square.to_i.between?(1,9)
      prompt get_message(:invalid_already_chosen)
    else
      prompt get_message(:invalid_out_of_bounds)
    end
    prompt(get_message(:user_move), joinor(empty_squares))
    user_square = gets.chomp
  end
  user_square.to_i
end

def conv_sq_to_address(square_no)
  row_no = (square_no - 1) / 3
  col_no = (square_no - 1) % 3
  [row_no, col_no]
end

def update_board(board, square, current_player)
  marker = MARKER[current_player]
  row_no, col_no = conv_sq_to_address(square)
  board[row_no][col_no] = marker
end

def get_current_move(current_player, empty_squares, board)
  if current_player == "user" 
    return get_user_move(empty_squares)
  else
    return get_computer_move(empty_squares, board)
  end
end

def find_winning_square(board, empty_squares, current_player)
  temp_board = board.map(&:clone)
  winning_squares = []
  empty_squares.each do |square|
    row_no, col_no = conv_sq_to_address(square)
    temp_board[row_no][col_no] = MARKER[current_player]
    winning_squares << square if won?(temp_board, square, current_player)
    temp_board = board.map(&:clone)
  end
  winning_squares
end

def find_risky_square(board, empty_squares, current_player)
  current_player = next_player(current_player)
  find_winning_square(board, empty_squares, current_player)
end

############ GamePlay - AI ###################
def get_computer_move(empty_squares, board, mode = GAME_PARAMETERS[:difficulty])
  case mode
  when "easy"
    return get_computer_move_easy(empty_squares)
  when "medium"
    return get_computer_move_medium(empty_squares, board)
  when "hard"
    return get_computer_move_hard(empty_squares, board)
  when "hell"
    return get_computer_move_hell(board, empty_squares)
  end
end

def get_computer_move_easy(empty_squares)
  empty_squares.sample
end

def get_computer_move_medium(empty_squares, board)
  risky_squares = find_risky_square(board, empty_squares, "computer")
  return risky_squares.sample unless risky_squares.empty?
  empty_squares.sample
end

def get_computer_move_hard(empty_squares, board)
  winning_squares = find_winning_square(board, empty_squares, "computer")
  risky_squares = find_risky_square(board, empty_squares, "computer")
  return winning_squares.sample unless winning_squares.empty?
  return risky_squares.sample unless risky_squares.empty?
  return 5 if empty_squares.include? 5 
  empty_squares.sample
end

def get_computer_move_hell(board, empty_squares)
  find_best_move(board, empty_squares, "computer")
end

####### Min Max #########
def find_immediate_best_move(board, current_player, empty_squares)
  winning_squares = find_winning_square(board, empty_squares, current_player)
  return winning_squares.sample if !winning_squares.empty? 
  return empty_squares.sample if empty_squares.length == 1
  risky_squares = find_risky_square(board, empty_squares, current_player)
  return risky_squares.sample if !risky_squares.empty? 
  return nil
end

def get_highest_score_move(move_score_hash)
  highest_score = move_score_hash.values.max
  move_score_hash.select {|key,value| value == highest_score}.keys.sample
end

def find_best_move(board, empty_squares, current_player)
  immediate_best_move = find_immediate_best_move(board, current_player, empty_squares)
  return immediate_best_move unless immediate_best_move.nil?

  move_score_hash = {}
  empty_squares.each do |square|
    temp_board = board.map(&:clone)
    update_board(temp_board, square, current_player)
    move_score_hash[square] = calculate_best_result(temp_board, next_player(current_player),
                                                    starting_player = current_player)
  end
  get_highest_score_move(move_score_hash)
end

def calculate_best_result(board, current_player, starting_player)
  empty_squares = get_empty_squares(board)
  winning_squares = find_winning_square(board, empty_squares, current_player)
  unless winning_squares.empty? 
    return current_player == starting_player ? 1 : -1
  end
  return 0 if empty_squares.length == 1
  risky_squares = find_risky_square(board, empty_squares, current_player)
  squares_to_traverse = risky_squares.empty? ? empty_squares : risky_squares

  all_move_result = squares_to_traverse.map do |square|
    temp_board = board.map(&:clone)
    update_board(temp_board, square, current_player)
    calculate_best_result(temp_board, next_player(current_player), starting_player)
  end
  current_player != starting_player ? all_move_result.min : all_move_result.max
end


############################# GamePlay - Overall #############################
def user_2_start?
  true
end

def next_player(current_player)
  current_player == "user" ? "computer" : "user"
end

def display_current_move(current_player, current_move)
  prompt(current_player, get_message(:move_made), current_move)
end

def update_score(score, winner)
  score[winner] += 1 if winner
end

def display_match_result(winner, score)
  prompt winner ? "#{winner} wins" : "it's a tie"
  pp_score(score)
end

def grand_winner?(score)
  score.values.max >= GAME_PARAMETERS[:winner_cutoff]
end

def get_continue_answer
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

  prompt(get_message(:thanks))
end

############################# Determine Winner #############################
def won?(board, move, current_player)
  marker = MARKER[current_player]
  row_no, col_no = conv_sq_to_address(move)
  return true if filled_row?(row_no, board, marker)
  return true if filled_column?(col_no, board, marker)
  return true if filled_diag_159?(board, marker)
  return true if filled_diag_357?(board, marker)
  false
end

def filled_row?(row_no, board, marker)
  board[row_no].uniq == [marker]
end

def filled_column?(col_no, board, marker)
  board.map { |sub_arr| sub_arr[col_no] }.uniq == [marker]
end

def filled_diag_159?(board, marker)
  [board[0][2], board[1][1], board[2][0]].uniq == [marker]
end

def filled_diag_357?(board, marker)
  [board[2][2], board[1][1], board[0][0]].uniq == [marker]
end

############################# Settings ##############################
def pp_settings(settings)
  settings_keys = settings.keys
  settings_keys.each_with_index do |value, index| 
    prompt "#{index + 1}) #{value.upcase} (Current Value : #{settings[value]})" 
  end
end

def valid_setting?(settings, choice)
  setting_names = settings.keys
  return (setting_names.include? choice.downcase.to_sym) || 
          ((setting_names[choice.to_i - 1]) && (choice.to_i.to_s == choice) &&
            (choice.to_i > 0))
end

def get_setting_from_user(name, settings)
  greet(name)
  prompt get_message(:settings_welcome)
  pp_settings(settings)
  choice = gets.chomp
  until valid_setting?(settings, choice)
    prompt get_message(:valid_setting)
    choice = gets.chomp
  end
  prompt(get_message(:chosen_setting), 
          choice.to_i == 0 ? choice.upcase : settings.keys[choice.to_i - 1].upcase)
  choice.to_i == 0 ? choice.to_sym : settings.keys[choice.to_i - 1]
end

def show_help_message(setting)
  msg_key = setting.to_s + "_help"
  prompt(get_message(msg_key.to_sym))
end

def valid_separator?(marker)
  marker.size == 1
end

def get_board_marker(current_settings, setting_to_update)
  marker_input_msg = get_message(:update_setting) + setting_to_update.to_s
  marker_invalid_msg = get_message(:valid_marker)
  current_marker_value = current_settings[setting_to_update]
  new_marker_value = get_object_from_user(marker_input_msg, :valid_separator?, marker_invalid_msg)
  while (current_settings.values.include? new_marker_value) && (new_marker_value != current_marker_value)
    prompt(new_marker_value, get_message(:duplicate_marker))
    new_marker_value = get_object_from_user(marker_input_msg, :valid_separator?, marker_invalid_msg)
  end
  new_marker_value
end

def get_updated_setting_value(current_settings, setting_to_update)
  show_help_message(setting_to_update)
  board_markers = [:row_separator, :col_separator, :intersection_marker,
                    :marker_user, :marker_computer, :marker_initial]
  return get_board_marker(current_settings,
            setting_to_update) if board_markers.include? setting_to_update
end

def update_settings(current_settings, setting_to_update, new_value)
  current_settings[setting_to_update] = new_value
end

############################# Main Code #############################
clear_screen

display_welcome

name = get_name

option = get_option(name)

if option == 1
  score = new_score
  BOARD_PARAMETERS, GAME_PARAMETERS, MARKER = get_game_settings
  loop do
    board = setup_initial_board
    current_player = user_2_start? ? "user" : "computer"
    winner = nil

    display_board(board)

    empty_squares = get_empty_squares(board)
    loop do
      current_move = get_current_move(current_player, empty_squares, board)
      update_board(board, current_move, current_player)
      display_board(board)
      display_current_move(current_player, current_move)

      winner = current_player if won?(board, current_move, current_player)
      empty_squares = get_empty_squares(board)
      break if winner || empty_squares.empty?
      current_player = next_player(current_player)
    end

    update_score(score, winner)
    display_match_result(winner, score)

    break if grand_winner?(score)

    response = get_continue_answer
    break unless play_again?(response)
  end

  display_bye(score, name)
end

if option == 2
  config_opt = YAML.load(File.read(CONFIG_OPT_PATH))
  loop do
    choice = get_setting_from_user(name, config_opt)
    updated_choice_value = get_updated_setting_value(config_opt, choice)
    update_settings(config_opt, choice, updated_choice_value)
  end
end
# ######################Features
# Random comments by the computer
# Coin Toss to decide who goes first
# Ask to increase challenge level
# Keep showing computer and player markers (Or make it an option)
# Refer to player by name
# Change the message for choosing squares
# Refactor continue using our get_object_from_user
# Better spacing between messages
# Don't Quit directly After the message Go To Main Loop of
# Weird artifcat when computer is starting
# Don't quit directly after winning the game. Ask a message to quit
# based on result
# Sentences for thinking and bye which are randomly generated
# We shouldn't be jumping into any step Flow should be smoother
# Consider Right justifying the board, another option in the setting
# Tell settings can't be changed once a game starts
# clear screen at end of settings before showing new menu

## Flow
=begin
 Ask For Name
 2 Options) Tournament  Settings Help
 Tournament Game Mode
 Help Different Shortcut Keys (C to continue)

 Tournament Mode
  Greet User
  Round Number
  Current Score
  Game Info

 Settings -> Things the User can change
          -> Can only set this at start of game. Once Game Starts no changing
          -> Change config file based on user inputs
  Tournament Size
  Computer Personality for comments ?
  Q for quitting, S for saving and quitting
  No need for quotes
  Show current values 
  cancel after choosing to edit some setting

 Help
  display current board
  show score
  Game Info (Difficulty, Tournament Size)
  quit
  Restart Tournament
  History of Moves
  Hint (Show any dangerous Squares)
  change_preferences (Bad idea? because it breaks flow)
  help table
  clear screen
=end
