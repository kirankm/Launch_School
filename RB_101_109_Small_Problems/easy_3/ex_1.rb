def doesnt_appear(number, arr)
  puts "The number #{number} doesn't appear in #{arr}"
end

def does_appear(number, arr)
  puts "The number #{number} appears in #{arr}"
end

numbers = ["1st", "2nd", "3rd", "4th", "5th", "last"]
ori_arr = []
numbers.each do |number|
  puts "Enter the #{number} number"
  answer = gets.chomp
  ori_arr << answer
end

final_number = ori_arr.pop
(ori_arr.include? final_number) ? does_appear(final_number, ori_arr) : doesnt_appear(final_number, ori_arr)
