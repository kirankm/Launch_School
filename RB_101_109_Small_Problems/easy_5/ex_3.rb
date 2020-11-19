=begin
input 
  String in hh:mm format
Output
  Number
Questions
  Validation? Can times be invalid? like more than 27:`129`

B4 midnight

after midnight
  Get hour and minutes by separating on :
  Return hour * 60 + min
  
=end

def after_midnight(time)
  hour, min = time.split(":").map(&:to_i)
  (hour * 60 + min)%(24*60)
end

def before_midnight(time)
  total_min_in_day = 24*60
  (total_min_in_day - after_midnight(time)) % total_min_in_day
end

puts after_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts after_midnight('24:00') == 0

puts before_midnight('00:00') == 0
puts before_midnight('12:34') == 686
puts before_midnight('24:00') == 0

