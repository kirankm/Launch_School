def sum(a,b)
  return a + b
end

def minus(a,b)
  return a - b
end

def prod(a,b)
  return a * b
end

def div(a,b)
  return a / b
end

def rem(a,b)
  return a % b
end


def prompt(msg)
  puts "==> #{msg}"
end

oper_hash = Hash.new
oper_hash["+"] = :sum
oper_hash["-"] = :minus
oper_hash["*"] = :prod
oper_hash["/"] = :div
oper_hash["%"] = :rem

prompt("Enter the First Number")
first = gets.chomp.to_i

prompt("Enter the Second Number")
second = gets.chomp.to_i

oper_hash.each do |key, value|
  msg = "#{first} #{key} #{second} = #{method(value).call(first,second)}"
  prompt msg
end