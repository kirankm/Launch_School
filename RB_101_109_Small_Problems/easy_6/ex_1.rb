=begin
  input
    Number (float)
  Output
    string
    Degree integer(max value 360 followed by degree sign)
    0padded 2 digit minute followed by ' (max value 60)
    0padded 2 digit second followed by " (max value 60)

  Questions
    Can the input number be greater than 360. Should we take modulus and return
    At 360 what should be the value 0 or 360
  Algorithm
    Get The Integer part of num. 
    Degree = Integer part % 360
    Remaining = num - Degree

    Value = Remaining * 60
    Minutes = Integer(value)
    Remaining = Value - Minutes

    Value = Remaining * 60
    Seconds = Integer(value)
=end

DEGREE = "\xC2\xB0"

def dms(num)
  degrees = num.to_i % 360
  remaining = num - degrees 

  value = (remaining * 60) % 60
  minutes = value.to_i
  remaining = value - minutes

  value = remaining * 60
  seconds = value.to_i
  %(#{degrees}#{DEGREE}#{format("%02d", minutes)}'#{format("%02d", seconds)}")
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(254.6)
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(360)
puts dms(400)
puts dms(-40)
puts dms(-420)