def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2
    counter += 1
  end
  numbers
end

numbers = [1,2,3,4,5]
puts numbers.inspect
puts double_numbers!(numbers).inspect
puts numbers.inspect

def multiply_numbers!(numbers, multiple)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * multiple 
    counter += 1
  end
  numbers
end

numbers = [1,2,3,4,5]
puts numbers.inspect
puts multiply_numbers!(numbers,3).inspect
puts numbers.inspect

