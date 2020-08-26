=begin
  Ask the user for 2 numbers
  Ask the user for an operation to perform
  Perform the operation on the two numbers
  Output the result
=end

require "yaml"

LANGUAGE = "en"
FULL_CONFIG = YAML.load(File.read("calc_config.yml"))
CONFIG = FULL_CONFIG[LANGUAGE]

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

prompt(CONFIG[:welcome])
name = ""

loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(CONFIG[:valid_name])
  else
    break
  end
end
prompt("Hi #{name}")

loop do
  number1 = 0
  loop do
    prompt(CONFIG[:num1_prompt])
    number1 = Kernel.gets().chomp()
    break if valid_number?(number1)
    prompt(CONFIG[:valid_number]) 
  end

  number2 = 0
  loop do
    prompt(CONFIG[:num2_prompt])
    number2 = Kernel.gets().chomp()
    break if valid_number?(number2)
    prompt(CONFIG[:valid_number]) 
  end

  operator = 0

  loop do
    prompt(CONFIG[:operator_prompt])
    operator = Kernel.gets().chomp()
    break if valid_operator?(operator)
    prompt(CONFIG[:valid_operator]) 
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
  prompt(CONFIG[:continue]) 
  response = Kernel.gets().chomp()
  break unless response.downcase().start_with?("y")
end
