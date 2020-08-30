def titelize(str)
  str.split(" ").map {|x| x.capitalize}.join(" ")
end

words = "the flintstones rock"
puts titelize(words)
