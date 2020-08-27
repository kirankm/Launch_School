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

### Helper Functions
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
  begin
    (num.to_f >= 0) and Float(num)
  rescue ArgumentError
    false
  end
end

def positive_int?(num)
  begin
    (num.to_i >= 0) and Integer(num)
  rescue ArgumentError
    false
  end
end

def monthly_pay(amount, months, rate)
  monthly_installment = amount.to_f * (rate / (1 - (1 + rate)**(-months)))
  return amount.to_f / months if monthly_installment.nan?
  monthly_installment
end

### Main Program
prompt(get_message(:welcome))

## Get Name
name = gets.chomp()

while !valid_name?(name)
  prompt(get_message(:valid_name))
  name = gets.chomp()
end

prompt(get_message(:greet), name.capitalize)

loop do
  ## Get Loan Amount
  prompt(get_message(:loan_amount))

  loan_amount = gets.chomp()
  while !positive_float?(loan_amount)
    prompt(get_message(:valid_loan_amt))
    loan_amount = gets.chomp()
  end

  # Get Interest Rate
  prompt(get_message(:loan_rate))

  loan_rate = gets.chomp()
  while !positive_float?(loan_rate)
    prompt(get_message(:valid_loan_rate))
    loan_rate = gets.chomp()
  end

  # Get Loan Duration
  loan_years = ""
  loan_months = ""
  loop do
    # Get Loan Years
    prompt(get_message(:loan_years))

    loan_years = gets.chomp()
    while !positive_int?(loan_years)
      prompt(get_message(:valid_loan_years))
      loan_years = gets.chomp()
    end

    # Get Loan Months
    prompt(get_message(:loan_months))

    loan_months = gets.chomp()
    while !positive_int?(loan_months)
      prompt(get_message(:valid_loan_months))
      loan_months = gets.chomp()
    end

    break if (loan_years.to_i > 0) || (loan_months.to_i > 0)
    prompt(get_message(:valid_loan_term))
  end

  prompt(get_message(:separator))
  prompt(get_message(:details))
  prompt(get_message(:amt), loan_amount.to_s)
  prompt(get_message(:rate), "#{loan_rate}%")
  prompt(get_message(:term), "#{loan_years} Years &", "#{loan_months} Months")

  # Calculating Monthly Installment
  annual_interest_rate = loan_rate.to_f / 100
  monthly_intest_rate = annual_interest_rate / 12
  total_months = 12 * loan_years.to_i + loan_months.to_i

  monthly_installment = monthly_pay(loan_amount, total_months,
                                    monthly_intest_rate)
  prompt(get_message(:installment), monthly_installment.to_s)
  prompt(get_message(:separator))

  prompt(get_message(:continue))
  response = gets.chomp[0].downcase
  break unless response == "y"
end

prompt(get_message(:thanks))
prompt(get_message(:bye))
