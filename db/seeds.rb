# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Role.destroy_all
AdminUser.first.add_role :admin
puts 'ROLES'
["admin",
 "ERL",
 "ERS"].each do |role|
  	Role.find_or_create_by_name({ :name => role }, :without_protection => true)
end
puts 'Locations'
Location.destroy_all

[['Cuarto Ropa Sucia','CRS'],
 ['Cuarto Ropa Limpia','CRL'],
 ['Primero Piso','P1'],
 ['Segundo Piso','P2'],
 ['Tercer Piso','P3'],
 ['Cuarto Piso','P4'],
 ['Quinto Piso','P5'],
 ['Subterraneo 1','S1']].each do |i|
  Location.find_or_create_by_codigo(codigo: i[1],name:i[0] )


end

puts 'Inventories'
Inventory.destroy_all
Location.all.each do |l|
	if l.codigo != "CRS"
  		l.inventories << Inventory.create(state: 'limpia')
	else 
		l.inventories << Inventory.create(state: 'sucia')
	end
end

puts 'Categories'
csv_text = File.read('db/categorias.csv')
categorias = CSV.parse(csv_text)
categorias.each do |cat|
  Category.find_or_create_by_name(:name=> cat[0])
end

puts 'Cloths'
csv_text = File.read('db/ropa_hospitalaria.csv')
ropa = CSV.parse(csv_text)
ropa.each do |cat|
  category_id = Category.where( name: cat[8]).first.id
  Cloth.find_or_create_by_name(:name => cat[0], distintion: cat[1],depth: cat[2],width: cat[3],height: cat[4],color: cat[5],description:  cat[6],feston:  cat[7],category_id: category_id)
end
