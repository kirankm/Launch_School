def sentence(name, activity)
  "#{name} went #{activity} today"
end

def name(names)
  names.sample
end

def activity(activities)
  activities.sample
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))

