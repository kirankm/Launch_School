flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# method 1
out = {}
flintstones.each_with_index {|value, index| out[value] = index}
puts out

# method 2
puts flintstones.to_h {|x| [x, flintstones.index(x)]}

# method 3
puts flintstones.each_with_object({}) {|x, hash| hash[x] = flintstones.index(x)}
