class Person
  attr_accessor :last_name, :first_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    self.first_name + " " + self.last_name
  end
  
  def name=(full_name)
    parse_full_name(full_name)
  end
  
  private
  def parse_full_name(full_name)
    names = full_name.split(" ")
    @first_name = names[0]
    @last_name = names.length > 1 ? names[-1] : ""
  end

  def to_s
    name
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'
bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
puts (bob.first_name == rob.first_name) && (bob.last_name == rob.last_name)

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

