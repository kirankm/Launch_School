ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

#Method 1
puts ages.values.sum

#method 2
puts ages.reduce(0) {|sum, (key,val)| sum+val}
