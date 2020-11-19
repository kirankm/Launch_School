=begin
  input -> string
  Output -> Input string surrounded by a box

  Questions
    1) What to enter in the case of empty string

  Algorithm
    Get length of string = str_len
    create Boundary row
    Create empty row
    Create Value Row
    Create Empty row
    Create Value Row

Create boundary row
    Add +
    Add str_len + 2 times -
    Add +

Create empty row 
    add |
    Add str_len + 2 times Space
    add |

Create Value row
    add |
    add space
    add str input
    add space
    add |
=end

def create_boundary_row(str)
  puts "+" + "-" * ( str.length + 2 ) + "+"
end

def create_empty_row(str)
  puts "|" + " " * ( str.length + 2 ) + "|"
end

def create_value_row(str)
  puts "|" + " " + str + " " + "|"
end

def print_in_box(str)
  create_boundary_row(str[0,76])
  create_empty_row(str[0,76])
  counter = 0
  while counter < str.length
    create_value_row(str[counter, 76] + " "*(76 -str[counter, 76].length ))
    counter += 76
  end
  create_empty_row(str[0,76])
  create_boundary_row(str[0,76])
end

print_in_box('To boldly go where no one has gone before. To boldly go where no one has gone before.')

