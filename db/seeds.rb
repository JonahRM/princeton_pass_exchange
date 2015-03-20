Club.destroy_all

clubs = [
  { :name => "Cannon"},
  { :name => "Cap and Gown"},
  { :name => "Charter"},
  { :name => "Cloister"},
  { :name => "Colonial"},
  { :name => "Cottage"},
  { :name => "Ivy"},
  { :name => "Quad"},
  { :name => "Terrace"},
  { :name => "Tiger Inn"},
  { :name => "Tower"}
]

clubs.each do |c|
  p = Club.new
  p.name = c[:name]
  p.save
end

puts "There are now #{Club.count} clubs in the database."
