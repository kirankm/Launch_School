def display_choice(player, computer)
  if win?(player, computer)
    prompt "Player Won"
  elsif win?(computer, player)
    prompt "Computer Won"
  else
    prompt "It's a tie"
  end
end

def prompt(message)
  Kernel.puts("==> #{message}")
end

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
end

VALID_OPTIONS = %w(rock paper scissors)

player_choice = "rock"
loop do
  loop do
    prompt "choose one: #{VALID_OPTIONS.join(', ')}"
    player_choice = Kernel.gets().chomp()
    break if VALID_OPTIONS.include? player_choice.downcase
    prompt "Please enter one option in #{VALID_OPTIONS.join(' or ')}"
  end

  computer_choice = VALID_OPTIONS.sample

  prompt "You chose: #{player_choice}; computer chose: #{computer_choice}"
  display_choice(player_choice, computer_choice)

  prompt "Do you want to play again. Reply Y for yes"
  answer = gets.chomp()
  break unless answer.downcase.start_with?("y")
end

prompt "Thanks for playing #{VALID_OPTIONS.join(' ').upcase}"
