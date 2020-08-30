produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def produce_select(type, product)
  hash = product.keys
  counter = 0
  result_hash = {}
  loop do 
    curr_key = hash[counter]
    result_hash[curr_key] = product[curr_key] if product[curr_key] == type
    counter += 1
    break if counter >= hash.size
  end
  result_hash
end

puts produce_select("Fruit", produce)
