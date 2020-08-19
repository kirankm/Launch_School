contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

def update_contact(name, arr,contacts)
  contacts[name][:email] = arr[0][0]
  contacts[name][:address] = arr[0][1]
  contacts[name][:phone] = arr[0][2]
end
  
def get_fname(name)
  name.split(" ")[0].downcase
end


def filter_by_name(arr, name)
  arr[0].split("@")[0] == name
end

def merge_contact(contacts, contact_data)
  contacts.each do |name,v|
    update_contact(name, contact_data.select {|x| filter_by_name(x, get_fname(name))}, contacts)
  end
end

merge_contact(contacts, contact_data)
puts contacts
