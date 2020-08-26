=begin
Inputs (From User)
  1) Loan Amount 
  2) Annual Percentage Rate
  3) Loan Duration

Output
  Monthly Installment to be paid
  M = P*(J/(1-(I+J)**(-N)))

=end
LANGUAGE = "en"

require "yaml"
require "pry"

CONFIG = YAML.load(File.read("loan_config.yml"))

### Helper Functions

def prompt(msg, lang = "en")
  Kernel.puts("==> #{CONFIG[lang][msg]}")
end

def valid_name?(name)
  (name.to_i == 0) && (name.length > 0) && (name.upcase != name.downcase)
end

def valid_loan_amt?(amount)
  amount > 0
end

def valid_loan_duration?(duration)
  duration > 0
end

def valid_loan_rate?(rate)
  rate > 0 && rate <= 100
end

def monthly_rate(annual_rate)
  annual_rate/12.0
end

def total_months(no_years)
  no_years * 12
end

def monthly_pay(amt, years, annual_rate)  
  duration = total_months(years)
  int_rate = monthly_rate(annual_rate)/100

  mon_installment = amt*(int_rate/term3)
  return mon_installment
end

### Main Program
prompt(:welcome)

## Get Name
name = gets.chomp()

while !valid_name?(name)
  prompt(:valid_name)
  name = gets.chomp()
end

puts "==> Hi #{name}"

loop do
  ## Get Loan Amount
  prompt(:loan_amount)
  loan_amount = gets.chomp().to_i()

  while !valid_loan_amt?(loan_amount)
    prompt(:valid_loan_amt)
    loan_amount = gets.chomp().to_i()
  end

  # Get Loan Duration
  prompt(:loan_duration)
  loan_duration = gets.chomp().to_f()

  while !valid_loan_duration?(loan_duration)
    prompt(:valid_loan_dur)
    loan_duration = gets.chomp().to_f()
  end

  # Get Interest Rate
  prompt(:loan_rate)
  loan_rate = gets.chomp().to_f()

  while !valid_loan_rate?(loan_rate)
    prompt(:valid_loan_rate)
    loan_rate = gets.chomp().to_f()
  end


  puts "==> Loan amt is #{loan_amount} and duration is #{loan_duration} and rate is #{loan_rate}"

  monthly_installment = monthly_pay(loan_amount, loan_duration, loan_rate)
  puts "==> The monthly installment to be paid #{monthly_installment}"

  prompt(:continue)
  response = gets.chomp[0].downcase
  break unless response == "y"
end