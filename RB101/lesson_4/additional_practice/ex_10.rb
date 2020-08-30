munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def age_group(age)
  if age <= 17
    "kid"
  elsif age <= 64
    "adult"
  else
    "senior"
  end
end

munsters.each do |key, value|
  munsters[key]["age_group"] = age_group(value["age"])
end

puts munsters
