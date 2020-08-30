flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.select {|x| x[0,2] == "Be"}.first
