=begin
  input n (integer) number of lights and number of passes
  output array with indexes where value is on at end of n passes

  Algorithm
  array = ["off", .... n times]
  for i in range 1 to n
    iterate through array starting with i and step sie i and swap state
  return array where state is on
=end

def swap!(light_array, idx)
  state = light_array[idx]
  new_state = (state == "on") ? "off" : "on"
  light_array[idx] = new_state
end

def n_lights(n)
  light_array = ["skip"] + ["off"] * n
  for i in (1..n)
    (i..n).step(i).map {|idx| swap!(light_array, idx)}
  end
  light_array.size.times.select {|x| light_array[x] == "on"}
end

p n_lights(5)
p n_lights(99)

