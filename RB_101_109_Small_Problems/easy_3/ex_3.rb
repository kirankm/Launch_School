puts "Enter a message"
msg = gets.chomp

char_cnt = msg.split(" ").map(&:chars).flatten.length
puts "There are #{char_cnt} characters in \"#{msg}\""