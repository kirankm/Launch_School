=begin
input array of objects
output: Print each element alongside occurances "element => occurances"

Questions
Does array contain strings only (Assume yes for now)
what to return in the case of empty array -> Nothing to be printed

Examples
1)
  vehicles = [
    'car', 'car', 'truck', 'car', 'SUV', 'truck',
    'motorcycle', 'motorcycle', 'car', 'truck'
  ] -> 
  car => 4
  truck => 3
  SUV => 1
  motorcycle => 2
2)
  vehicles = [] ->
  
Data structure
Array for input
Hash for stroing element count mapping

Algorithm
Set hash = {}
for each element in array
  if element already in hash increment count by 1
  else set count for that element = 1
for each element value in hash
  print "element => value"
=end

def count_occurrences(arr)
  out_hash = Hash.new(0)
  arr.each {|ele| out_hash[ele] += 1}
  print_out(out_hash)
end

def print_out(out_hash)
  out_hash.each {|key, value| puts "#{key} => #{value}"}
end

vehicles = [
    'car', 'car', 'truck', 'car', 'SUV', 'truck',
    'motorcycle', 'motorcycle', 'car', 'truck'
  ]

count_occurrences(vehicles)

puts "test 2"
count_occurrences([])