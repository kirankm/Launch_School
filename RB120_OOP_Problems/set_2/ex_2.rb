class Cat
  attr_accessor :name
  @@cat_count = 0
  
  def self.generic_greeting
    puts "Hello, I'm a cat"
  end
  
  
  def self.count
    @@cat_count
  end

  def initialize(name)
    @name = name
    @@cat_count += 1
  end
  
  def personal_greeting
    puts "Hello, I'm #{name}"
  end  
  def rename(name)
    self.name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
puts kitty.name
kitty.rename('Chloe')
puts kitty.name

p kitty.identify

puts Cat.generic_greeting
puts kitty.personal_greeting



kitty1 = Cat.new("tom")
kitty2 = Cat.new("puss")

puts Cat.count

