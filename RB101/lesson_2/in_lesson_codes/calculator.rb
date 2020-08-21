=begin
  Ask the user for 2 numbers
  Ask the user for an operation to perform
  Perform the operation on the two numbers
  Output the result
=end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def is_valid_number(num)
  num.to_i().to_s() == num
end

def is_valid_operator?(operator)
  valid_operators = [1,2,3,4]
  valid_operators.include?(operator.to_i)
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
    break if is_valid_number(number1)
    puts "Hmm that doesn't look like a valid number"
  end

  number2 = 0
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
    break if is_valid_number(number2)
    puts "Hmm that doesn't look like a valid number"
  end

  operator = 0
  loop do
    prompt("What's the opeation to perform? 1) add 2)subtract 3)multiply 4 divide")
    operator = Kernel.gets().chomp()
    break if is_valid_operator?(operator)
    prompt("Please enter a valid operator from the given options")
  end

  result = case operator 
            when "1"
              number1.to_i + number2.to_i
            when "2"
              number1.to_i - number2.to_i
            when "3"
              number1.to_i * number2.to_i
            when "4"
              number1.to_f/number2.to_i
  end

  prompt("The result is #{result}")

  prompt("Hi #{name}, would you like to continue using the calculator. Type Y for continuing")
  response = Kernel.gets().chomp()
  break unless response.downcase().start_with?("y")
end

