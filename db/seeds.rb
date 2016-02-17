# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do 
    User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(10)
        )
end

test_user = User.create!(
    name: 'Theresa',
    email: 'tpalid@gmail.com',
    password: 'helloworld'
    )

users = User.all

100.times do
    RegisteredApplication.create!(
        name: Faker::App.name,
        url: Faker::Internet.url,
        user: users.sample
        )
end
registered_applications = RegisteredApplication.all


500.times do
    Event.create!(
        name: Faker::Lorem.word,
        registered_application: registered_applications.sample
        )
    end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} applications created"
puts "#{Event.count} events created"



