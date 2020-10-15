munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


munster_names = munsters.keys

for munster in munster_names 
  puts "#{munster} is a #{munsters[munster]["age"]}-year-old #{munsters[munster]["gender"]}."
end

munsters.each do |name, value|
  puts "#{name} is a #{value["age"]}-year-old #{value["gender"]}."
end
