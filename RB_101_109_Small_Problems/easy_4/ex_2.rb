=begin
  Inputs
    Number 

  output string with century

  Questions
  Can number less than 0

  century(2000) == '20th'
  century(2001) == '21st'
  century(1965) == '20th'
  century(256) == '3rd'
  century(5) == '1st'
  century(10103) == '102nd'
  century(1052) == '11th'
  century(1127) == '12th'
  century(11201) == '113th'

  Algorithm
  1) Divide by 100 and get the century number as whatever remains plus 1
  2) Pick suffix based on the numer to suffix mapping
  3) Return number + suffix
=end

def century(year)
  century = 1 + ( year / 100 )
  century -= 1 if year % 100 == 0
  century_string(century)
end

def century_string(century)
  century_rem = century % 100
  last_digit = century_rem %10
  mapping = { 
    1 => "st",
    2 => "nd",
    3 => "rd"
  }
  if century_rem.between?(4,20)
    century.to_s + "th"
  elsif last_digit.between?(1,3)
    century.to_s + mapping[last_digit]
  else
    century.to_s + "th"
  end
end

# puts century_string(2)
# puts century_string(13)
# puts century_string(45)
# puts century_string(112)
# puts century_string(102)
# puts century_string(0)

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'