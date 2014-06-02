# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([{ name: 'News' }, { name: 'Showbiz' }, { name: 'Fashion' }, { name: 'Music' }, { name: 'Ideas' }])
admins = Admin.create!({:email => 'lukeamarsh@gmail.com', :password => 'smurfitt', :password_confirmation => 'smurfitt'})
admins = Admin.create!({:email => 'we.worldedit@gmail.com', :password => 'hellomate', :password_confirmation => 'hellomate'})