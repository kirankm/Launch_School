puts "What is your name?"
name = gets.chomp

def greet(name)
  puts "Hello #{name}."
end

def scream(name)
  name = name[0, name.length - 1]
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
end

def scream?(name)
  name.chars[-1] == "!"
end

scream?(name) ?  scream(name) : greet(name)
