require 'csv'

csv_text = File.read(Rails.root.join('db','pokemon.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Pokemon.new
  t.name = row['Name']
  t.type_one = row['Type 1']
  t.type_two = row['Type 2']
  t.total = row['Total']
  t.hp = row['HP']
  t.attack = row['Attack']
  t.defense = row['Defense']
  t.sp_atk = row['Sp. Atk']
  t.sp_def = row['Sp. Def']
  t.speed = row['Speed']
  t.generation = row['Generation']
  t.legendary = row['Legendary']
  t.save
end

puts "There are now #{Pokemon.count} pokemons"