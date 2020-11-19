def staggered_case(str, first_upcase = true)
  adder = first_upcase ? 0 : 1
  str.chars.map.with_index do |val, idx|
    (idx + adder).even? ? val.upcase : val.downcase
  end.join("")
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('ignore 77 the 444 numbers', false)