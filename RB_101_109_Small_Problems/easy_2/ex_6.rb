#Array(1..99).each { |x| puts x if x.odd? }

puts (1..99).select(&:odd?)
