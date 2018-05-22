# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
table = 'products'
auto_inc_val = 1
ActiveRecord::Base.connection.execute(
  "ALTER SEQUENCE #{table}_id_seq RESTART WITH #{auto_inc_val}"
)
Product.create(title: 'Runy Book', description: '<h>Learn Ruby programing</h>', price: 12.99, published: true)
Product.create(title: 'JQuery Book', description: 'Learn <i>JQuery', price: 11.99, published: true)
Product.create(title: 'SASS Book', description: 'Learn CSS<br/> with SASS', price: 19.99, published: true)
