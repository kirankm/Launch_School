=begin
  Input 
    Integer (can be positive or negative)
  Output
    String "hh:mm"
  Questions
    Railway Time?
    Can Number be greater than 24*60 (number of minutes in a day)
  Algorithm
    Convert Input into hours and Minutes
=end

def time_of_day(minutes)
  hr, min = minutes.divmod(60)
  _, hr = hr.divmod(24)
  format("%02d:%02d", hr, min)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"