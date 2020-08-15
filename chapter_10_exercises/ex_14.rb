a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

out = a.map {|x| x.split(" ")}
print out.flatten
