=begin
Inputs (From User)
  1) Loan Amount
  2) Annual Percentage Rate
  3) Loan Duration

Output
  Monthly Installment to be paid
  M = P*(J/(1-(I+J)**(-N)))

=end
require "yaml"

LANGUAGE = "en"

CONFIG = YAML.load(File.read("loan_config.yml"))

########################################################## Helper Functions #########################################################
def clear_screen
  system('clear') || system("cls")
end

def prompt(*msg)
  puts "==> #{msg.join(' ')}"
end

def get_message(msg, lang = "en")
  CONFIG[lang][msg]
end

def valid_name?(name)
  (name.to_i == 0) && (name.length > 0) && (name.upcase != name.downcase)
end

def positive_float?(num)
  (num.to_f >= 0) && Float(num)
rescue ArgumentError
  false
end

def positive_int?(num)
  (num.to_i >= 0) && Integer(num)
rescue ArgumentError
  false
end

def monthly_pay(amount, months, rate)
  monthly_installment = amount.to_f * (rate / (1 - (1 + rate)**(-months)))
  monthly_installment = amount.to_f / months if monthly_installment.nan?
  monthly_installment
end

def format_amount(amt, type = "$")
  "#{type}#{amt.round(2)}"
end

def greet(name)
  prompt(get_message(:greet), name.capitalize)
end

def display_separator
  prompt(get_message(:separator))
end
########################################################################Functions That Interact##########################################################
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

def get_amount
  prompt(get_message(:loan_amount))
  loan_amount = gets.chomp()
  while !positive_float?(loan_amount)
    prompt(get_message(:valid_loan_amt))
    loan_amount = gets.chomp()
  end
  loan_amount
end

def get_apr
  prompt(get_message(:loan_rate))
  loan_rate = gets.chomp()
  while !positive_float?(loan_rate)
    prompt(get_message(:valid_loan_rate))
    loan_rate = gets.chomp()
  end
  loan_rate
end

def get_years
  prompt(get_message(:loan_years))

  loan_years = gets.chomp()
  while !positive_int?(loan_years)
    prompt(get_message(:valid_loan_years))
    loan_years = gets.chomp()
  end
  loan_years
end

def get_months
  prompt(get_message(:loan_months))
  loan_months = gets.chomp()
  while !positive_int?(loan_months)
    prompt(get_message(:valid_loan_months))
    loan_months = gets.chomp()
  end
  loan_months
end

def get_duration
  loan_years = ""
  loan_months = ""
  loop do
    loan_years = get_years
    loan_months = get_months

    break if (loan_years.to_i > 0) || (loan_months.to_i > 0)
    prompt(get_message(:valid_loan_term))
  end
  [loan_years, loan_months]
end

def calculte_installment(loan_rate, loan_amount, loan_years, loan_months)
  annual_interest_rate = loan_rate.to_f / 100
  monthly_intest_rate = annual_interest_rate / 12
  total_months = 12 * loan_years.to_i + loan_months.to_i

  monthly_installment = monthly_pay(loan_amount, total_months,
                                    monthly_intest_rate)
end

def display_loan_details(loan_amount, loan_rate, loan_years, loan_months, monthly_installment)
  prompt(get_message(:separator))
  prompt(get_message(:details))
  prompt(get_message(:amt), format_amount(loan_amount.to_f))
  prompt(get_message(:rate), "#{loan_rate}%")
  prompt(get_message(:term), "#{loan_years} Years &", "#{loan_months} Months")
  prompt(get_message(:installment), format_amount(monthly_installment))
  prompt(get_message(:separator))
end

def get_continue_answer
  prompt(get_message(:continue))
  response = gets.chomp[0].downcase
  while !["yes","y","no","n"].include? response
    prompt(get_message(:continue))
    response = gets.chomp[0].downcase
  end
  response
end

def play_again?(response)
  response == "y" || response == "yes"
end

def display_bye
  prompt(get_message(:thanks))
  prompt(get_message(:bye))
end

######################################################################## Main Program #####################################################################
clear_screen

display_welcome
name = get_name

loop do
  loan_amount = get_amount
  loan_rate = get_apr
  loan_years, loan_months = get_duration

  monthly_installment = calculte_installment(loan_rate, loan_amount, loan_years, loan_months)
  display_loan_details(loan_amount, loan_rate, loan_years, loan_months, monthly_installment)
 
  response = get_continue_answer
  break unless play_again?(response)
end

display_bye

