=begin
  Ask the user for 2 numbers
  Ask the user for an operation to perform
  Perform the operation on the two numbers
  Output the result
=end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  valid_float?(num) || valid_int?(num)
end

def valid_float?(num)
  Float(num) rescue false
end

def valid_int?(num)
  Integer(num) rescue false
end

def valid_operator?(operator)
  valid_operators = %w(1 2 3 4)
  valid_operators.include?(operator)
end

prompt("Welcome to Calculator! Enter Your Name:")
name = ""

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure to enter a valid name")
  else
    break
  end
end
prompt("Hi #{name}")

loop do
  number1 = 0
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()
    break if valid_number?(number1)
    puts "Hmm that doesn't look like a valid number"
  end

  number2 = 0
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
    break if valid_number?(number2)
    puts "Hmm that doesn't look like a valid number"
  end

  operator = 0
  operator_prompt = <<-PMT
    What is the operation to perform
    1) Addition
    2) Subtraction
    3) Multiplication
    4) Division
  PMT

  loop do
    prompt(operator_prompt)
    operator = Kernel.gets().chomp()
    break if valid_operator?(operator)
    prompt("Please enter a valid operator from the given options")
  end

  result = case operator
           when "1"
             number1.to_f + number2.to_f
           when "2"
             number1.to_f - number2.to_f
           when "3"
             number1.to_f * number2.to_f
           when "4"
             number1.to_f / number2.to_f
           end

  prompt("The result is #{result}")

  prompt("Hi #{name}, Type Y if you want to continue using the calculator")
  response = Kernel.gets().chomp()
  break unless response.downcase().start_with?("y")
end
