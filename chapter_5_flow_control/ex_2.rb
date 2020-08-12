def cap_long(str)
  if str.length > 10
    str.upcase
  else
    str
  end
end

puts cap_long("this si a really long string")
puts cap_long("small")

