def update_score(player, computer, score)
  if win?(player, computer)
    score["player"] += 1
    prompt "Player Won"
  elsif win?(computer, player)
    score["computer"] += 1
    prompt "Computer Won"
  else
    prompt "It's a tie"
  end
  prompt "The current score is #{score}"
end

def prompt(message)
  Kernel.puts("==> #{message}")
end

def win?(first, second)
  WIN_HASH[first].include? second
end

VALID_OPTIONS = %w(rock paper scissors lizard spock)
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

score = Hash.new
score["player"] = 0
score["computer"] = 0

loop do
  player_choice = "rock"

  loop do
    prompt "choose one: #{VALID_OPTIONS.join(', ')}"
    player_choice = Kernel.gets().chomp()
    player_choice = SHORT_FORM[player_choice] if SHORT_FORM[player_choice]

    break if VALID_OPTIONS.include? player_choice.downcase
    prompt "Please enter one option in #{VALID_OPTIONS.join(' or ')}"
  end

  computer_choice = VALID_OPTIONS.sample

  prompt "You chose: #{player_choice}; computer chose: #{computer_choice}"
  update_score(player_choice, computer_choice, score)

  prompt "Do you want to play again. Reply Y for yes"
  answer = gets.chomp()
  break unless answer.downcase.start_with?("y")
end

prompt "Thanks for playing #{VALID_OPTIONS.join(' ').upcase}"
