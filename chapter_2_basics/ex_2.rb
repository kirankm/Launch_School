number = 4321

units = number%10
tens = ((number - units)%100)/10
hundreds = ((number - 10*tens -units)%1000)/100
thousands = (number -100*hundreds - 10*tens -units)/1000
puts [thousands, hundreds,tens, units]

thousands2 = number/1000
hundreds2 = (number - thousands2*1000)/100
tens2 = (number - thousands2*1000 - hundreds2*100)/10
units2 = (number - thousands2*1000 - hundreds2*100 - tens2*10)
puts [thousands2, hundreds2,tens2, units2]
