class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    name = nil
    loop do
      puts "what's your name"
      name = gets.chomp
      break unless name.empty?
    end
    self.name = name
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper or scissors"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Please choose one option in Rock, Paper or Scissors"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ["Computer", "R2D2", "No5", "Chappie"].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  VALUES = ["rock", "paper", "scissors"]
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def >(other)
    case value
    when "scissors"
      return true if other.value == "paper"
    when "paper"
      return true if other.value == "rock"
    when "rock"
      return true if other.value == "scissors"
    end
  end

  def <(other)
    case value
    when "scissors"
      return true if other.value == "rock"
    when "paper"
      return true if other.value == "scissors"
    when "rock"
      return true if other.value == "paper"
    end
    false
  end

  def to_s
    value
  end
end

class RPSGame
  attr_accessor :human, :computer, :win_dict

  def initialize
    @human = Human.new
    @computer = Computer.new
    @win_dict = {}
    win_dict["rock"] = "scissors"
    win_dict["paper"] = "rock"
    win_dict["scissors"] = "paper"
  end

  def display_welcome_message
    puts "Welcome to Rock Paper Scissors "
  end

  def display_goodbye_message
    puts "Thanks for playing Rock Paper Scissors. Goodbye "
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} Wins"
    elsif human.move < computer.move
      puts "#{computer.name} Wins"
    else
      puts "It's a tie"
    end
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again"
      answer = gets.chomp
      break if ["y", "n"].include? answer.downcase
      puts "Sorry. Please enter either Yes or No"
    end
    return true if answer.downcase == "y"
    false
  end
end

RPSGame.new.play
