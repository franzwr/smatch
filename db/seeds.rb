# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.create(first_name: 'rodrigo', last_name: 'naranjo')
Player.create(first_name: 'rodrigo2', last_name: 'naranjo2')
Player.create(first_name: 'rodrigo3', last_name: 'naranjo3')
Player.create(first_name: 'rodrigo4', last_name: 'naranjo4')

Friend.create(player_id: 1, player2_id: 2)
Friend.create(player_id: 1, player2_id: 3)
Friend.create(player_id: 1, player2_id: 4)
Friend.create(player_id: 2, player2_id: 4)
