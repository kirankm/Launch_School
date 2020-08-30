ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
puts ages.reduce(32) {|curr_min, (_,value)| curr_min < value ? curr_min : value}
puts ages.values.min
