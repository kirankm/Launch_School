words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']


def sort_word(string)
  string.chars.sort.join
end

anagram_hash = Hash.new {|hash,key| hash[key] = []}

words.each {|x| anagram_hash[sort_word(x)].push(x)}

puts anagram_hash
