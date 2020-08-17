names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do 
  names.pop
  break if names.empty?
end

puts "the arrays name is #{names}"
