# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Category.destroy_all
table1 = 'products'
table2 = 'categories'
auto_inc_val = 1
ActiveRecord::Base.connection.execute(
  "ALTER SEQUENCE #{table1}_id_seq RESTART WITH #{auto_inc_val}"
)
ActiveRecord::Base.connection.execute(
  "ALTER SEQUENCE #{table2}_id_seq RESTART WITH #{auto_inc_val}"
)
binding.pry
c = Category.create!(name: 'Programing languages')
c.products.create!(title: 'Papers', description: 'description about papers', price: 10, published: true)

p = Array.new
p << Product.create!(title: 'Runy Book', description: '<h>Learn Ruby programing</h>', price: 12.99, published: true)
p << Product.create!(title: 'JQuery Book', description: 'Learn <i>JQuery', price: 11.99, published: true)
p << Product.create!(title: 'SASS Book', description: 'Learn CSS<br/> with SASS', price: 19.99, published: true)

p.each { |i| c.products << p }
puts 'Category title: ' + Product.first.category.inspect
puts Category.first.products.inspect
