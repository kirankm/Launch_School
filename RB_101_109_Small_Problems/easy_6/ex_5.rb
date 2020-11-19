def reverse(array)
  array.each_with_object([]) { |x, arr| arr.unshift(x)}
end

def reverse(array)
  array.inject([]) {|curr, x| curr.unshift(x)}
end

def reverse(array)
  array.sort {|a,b| array.index(b) <=> array.index(a)}
end

puts reverse([1,2,3,4])