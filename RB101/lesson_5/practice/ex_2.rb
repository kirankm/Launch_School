books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]


puts books.sort {|b1, b2| b2[:"published"].to_i <=> b1[:"published"].to_i}
puts books.sort_by {|x| -1*(x[:"published"].to_i)}
