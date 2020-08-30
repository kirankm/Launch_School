statement = "The Flintstones Rock"
puts statement.chars.each_with_object(Hash.new(0)) {|val, hash| hash[val] += 1}

puts statement.chars.each_with_object({}) {|val, hash| hash[val] = statement.scan(val).size}
