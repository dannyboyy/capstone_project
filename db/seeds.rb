# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 require 'faker'

 # Create Users
 5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.save!
end
users = User.all
 
 # Create Companies
 50.times do
   Company.create!(
     user:          users.sample,
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

 User.first.update_attributes!(
  email: 'wushuo1988@gmail.com',
  password: 'helloworld'
  )
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Company.count} companies created"
 puts "#{Comment.count} comments created"



