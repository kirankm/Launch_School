arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

out = arr.map do |hsh|
  incremental_hash = {}
  hsh.each {|key, _| incremental_hash[key] = hsh[key] + 1}
  incremental_hash
end

puts out.inspect
puts arr.inspect
