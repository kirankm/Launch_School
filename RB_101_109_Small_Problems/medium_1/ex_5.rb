=begin
  input 
    n -> odd integer
    Size of n*n grid
  output
    diamond drawn in a n*n grid
  Question
    When n = 0 what do draw
    When n = 1
    validation n is odd?
  Algorithm
    out_array = []
    append * times n to out_array
    counter = 1
    while 2* counter + 1 < n
      new_line = " "*counter + "*" * (n - 2* counter) +counter
      append new line to front and back
      counter += 1 
    end
    iterate through array and display output line by line
=end

def diamond(n)
  out_array = ["*" * n]
  counter = 1
  while 2*counter + 1 <= n
    new_line = " " * counter + "*" * (n - 2 * counter) + " " * counter
    out_array << new_line
    out_array.unshift(new_line)
    counter += 1
  end
  out_array.each { |line| puts line }
end

def print_row(grid_size, distance_from_center)
  stars = " "* grid_size
  stars[distance_from_center] = "*"
  stars[-distance_from_center -1] = "*"
  puts stars
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end


diamond(3)
diamond(7)
diamond(1)


