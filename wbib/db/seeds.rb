# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

topics = Topic.create(
  [
    {title: 'Cool Stuff', description: ' I hear there is alot of cool stuff in here!'},
    {title: 'Shitty stuff', description: ' Probabaly shouldn\'t go here, cause I hear all the stuff smells like shit'} 
  ]
)
