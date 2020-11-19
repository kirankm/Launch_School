def triangle(num)
  space_counter = num
  while space_counter >= 0
    puts " " * space_counter + "*" * (num - space_counter)
    space_counter -= 1
  end
end

def triangle(num)
  space_counter = 0
  while space_counter <= num
    puts " " * space_counter + "*" * (num - space_counter)
    space_counter += 1
  end
end

puts triangle(9)
