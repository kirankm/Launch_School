class Transform
  def self.lowercase(value)
    value.downcase
  end

  def initialize(value)
    @value = value
  end

  def uppercase
    @value.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

