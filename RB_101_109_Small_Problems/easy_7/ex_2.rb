def letter_case_count(str)
  out_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str.chars.each do |char|
    if char.ord.between?(97, 122)
      out_hash[:lowercase] += 1 
    elsif char.ord.between?(65, 90)
      out_hash[:uppercase] += 1
    else
      out_hash[:neither] += 1
    end
  end
  out_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
