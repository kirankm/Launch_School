class Cat
  attr_accessor :name
  COLOR = "purple" 

  def initialize(name)
    @name = name
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
  
  def greet
    puts "Hi, I am a #{COLOR} cat and my name is #{name}"
  end
end

kitty = Cat.new('Sophie')
puts kitty.name
kitty.rename('Chloe')
puts kitty.name

p kitty.identify




kitty1 = Cat.new("tom")
kitty2 = Cat.new("puss")

kitty2.greet

