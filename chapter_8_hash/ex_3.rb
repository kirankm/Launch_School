a = {1=> "one", 2=>"two"}

a.keys.each {|x| puts x}
a.values.each {|x| puts x}
a.each {|key,value| puts "#{key}:#{value}"}
