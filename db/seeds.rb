# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 require 'faker'
 
 # Create Companies
 50.times do
   Company.create!(
     name:          Faker::Company.name,
     description:   Faker::Company.catch_phrase
   )
 end
 companies = Company.all
 
 # Create Comments
 100.times do
   Comment.create!(
     company: companies.sample,
     body:    Faker::Lorem.paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Company.count} companies created"
 puts "#{Comment.count} comments created"