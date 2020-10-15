possible_char = Array("0".."9") + Array("A".."F")
struct = [8,4,4,4,12]
out = ["","","","",""]
struct.each_with_index do |x, index|
  x.times {out[index] << possible_char.sample}
end
puts out.join("-")
