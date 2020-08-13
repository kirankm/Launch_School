a = {1=> "one", 2=>"two"}
b = {3=>"three", 4=>"four"}

c = a.merge(b)
puts c
puts a
puts b

c = a.merge!(b)
puts c
puts a
puts b
