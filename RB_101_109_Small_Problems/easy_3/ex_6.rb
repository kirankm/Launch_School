def xor?(cond_1, cond_2)
  (cond_1 || cond_2) & (!(cond_1 && cond_2))
end

def xor?(a,b)
  !a != !b
end

puts xor?(true, true)
puts xor?(true, false)
puts xor?(false, true)
puts xor?(false, false)

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false