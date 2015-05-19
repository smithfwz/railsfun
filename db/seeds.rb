# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.destroy_all
Category.destroy_all


book_category 			 = Category.create!(title: 'book')
programming_category = Category.create!(title: 'programming')

Product.create!(title: 'Ruby book', description: 'Learn Ruby programming', price: 12.99, category: book_category, published: true)
Product.create!(title: 'jQuery book', description: 'Learn jQuery', price: 11.99 , category: book_category, published: true)
Product.create!(title: 'SASS book', description: 'Learn CSS with SASS', price: 19.99, category: book_category, published: false)
Product.create!(title: 'Ruby on Rails', description: 'Try ruby on rails', price: 20, category: programming_category, published: true)