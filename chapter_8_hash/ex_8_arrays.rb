require "pry"
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

def sort_string(a)
  a.chars.sort.join
end

sorted_words = words.map {|x| sort_string(x)}
anagram_groups = sorted_words.uniq
output_arr = []
anagram_groups.each {|x| output_arr.push([])}

puts output_arr

words.each do |x|
  output_arr[anagram_groups.index(sort_string(x))].push(x)
end
 
print output_arr
puts ""
