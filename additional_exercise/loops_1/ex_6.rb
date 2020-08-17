#require "Random"
prng = Random.new
i = 0

while i < 5
  puts prng.rand(1...100)
  i += 1
end

