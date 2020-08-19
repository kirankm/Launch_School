arr = ["laboratory", "experiment","Pans Labyrinth","elaborate", "polar bear"]

def has_lab?(word)
  /lab/ =~ word ? true : false
end

arr.each { |x|
  if has_lab? x then puts x end
}
