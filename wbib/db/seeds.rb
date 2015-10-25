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
    {title: 'Shitty stuff', description: ' Probabaly shouldn\'t go here, cause I hear all the stuff smells like shit'},
    {title: 'syzurp', description: ' yep no tit ass'},
    {title: 'flame stuff', description: ' flames and other stuff'}
  ]
)
references = Reference.create(
  [
    {url: 'google.com', topic_id: topics[0].id},
    {url: 'reddit.com', topic_id: topics[0].id},
    {url: 'msn.com', topic_id: topics[0].id},
    {url: 'poop.com', topic_id: topics[0].id},
    {url: 'google.com', topic_id: topics[1].id},
    {url: 'reddit.com', topic_id: topics[1].id},
    {url: 'msn.com', topic_id: topics[1].id},
    {url: 'poop.com', topic_id: topics[1].id},
    {url: 'google.com', topic_id: topics[2].id},
    {url: 'reddit.com', topic_id: topics[2].id},
    {url: 'msn.com', topic_id: topics[2].id},
    {url: 'poop.com', topic_id: topics[2].id},
  ]
)
