require "yaml"

operator_prompt = <<-PMT
    What is the operation to perform
    1) Addition
    2) Subtraction
    3) Multiplication
    4) Division
  PMT


message_dict = {}
message_dict[:welcome] = "Welcome to Calculator! Enter Your Name:"
message_dict[:num1_prompt] = "What's the first number?"
message_dict[:num2_prompt] = "What's the second number?"
message_dict[:valid_name] = "Make sure to enter a valid name"
message_dict[:valid_number] = "Hmm that doesn't look like a valid number"
message_dict[:operator_prompt] = operator_prompt
message_dict[:valid_operator] = "Please enter a valid operator from the given options"
message_dict[:continue] = "Type Y if you want to continue using the calculator"


File.open("calc_config.yml", "w") {|f| f.write(message_dict.to_yaml)}