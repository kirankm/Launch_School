daylight = [true, false].sample

def time_of_day(daylight)
  puts "It's daytime!" if daylight
  puts "It's nighttime!" if !daylight
end

time_of_day(daylight)

