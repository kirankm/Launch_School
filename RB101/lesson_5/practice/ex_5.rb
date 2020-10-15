munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

puts munsters.select {|_, value| value["gender"] == "male"}.reduce(0) {|sum, (_, value)| sum + value["age"]}

out = munsters.reduce(0) do |sum, (_,value)| 
  if value["gender"] == "male"
    sum + value["age"]
  else
    sum
  end
end
p out
