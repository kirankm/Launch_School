def reversed_string(str)
  str_array = str.chars
  out_array = []
  str_array.each {|chr| out_array.unshift(chr)}
  out_array
end

p reversed_string("abcd")

def fizzbuzz(start, end_val)
  Array(start..end_val).map do |x|
    output_string = ""
    output_string << "Fizz" if x % 3 == 0
    output_string << "Buzz" if x % 5 == 0
    output_string = x if output_string == ""
    output_string
  end
end

p fizzbuzz(1, 15)

def remove_vowels(strings)
  vowels = 'aeiouAEIOU'
  strings.map {|string| string.delete(vowels)}
end

p remove_vowels(["green", 'black'])

def balancer(string)
  balance_count = 0
  string.chars.each do |char| 
    balance_count += 1 if char == "("
    balance_count -= 1 if char == ")"
    return false if balance_count < 0
  end
  balance_count == 0
end

p balancer("()")
p balancer("())(")
p balancer("()()") 


def prime(a,b)
  a.upto(b).select {|x| check_prime(x)}
end

def check_prime(a)
  2.upto(a-1) {|x| return false if a%x == 0}
  return true
end

p "Checking prime"
p check_prime(7)
p check_prime(13)

p prime(3, 15)


def all_primes(n)
  out = 2.upto(n)
  out.each do |num| 
  end
end
    

def reverse_string(str)
  arr = str.chars
  arr.sort {|a,b| arr.index(b) <=> arr.index(a)}.join("")
end

puts reverse_string('abcde')