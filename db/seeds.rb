# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "GRRM", author_name: "George R.R. Martin", email: "george@westeros.com", password: "password")
User.create(username: "BioWare", author_name: "Casey Hudson", email: "casey@bioware.com", password: "password")
User.create(username: "LucasFilm", author_name: "George Lucas", email: "george@lucasfilm.com", password: "password")
User.create(username: "HighPriest", author_name: "Alan Moore", email: "alan@oldhut.com", password: "password")

Story.create(title: "Game of Thrones", summary: "Politics, blood and dragons.", user_id: 1, world_id: 1)
Story.create(title: "Mass Effect 2", summary: "A galactic soap opera!", user_id: 2, world_id: 2)
Story.create(title: "Star Wars", summary: "A band of rebels fight an evil empire.", user_id: 3, world_id: 3)
Story.create(title: "Watchmen", summary: "A realistic take on superhero mythology.", user_id: 4, world_id: 4)
Story.create(title: "V for Vendetta", summary: "An anarchistic vigilante faces down an authoritarian government.", user_id: 4, world_id: 5)

World.create(name: "Westeros", scale: "Continent", description: "A gritty medieval landscape with seven kingdoms ruled under one banner.")
World.create(name: "The Milky Way", scale: "Galaxy", description: "A massive, dynamic galactic society.")
World.create(name: "A Galaxy, Far, Far Away", scale: "Galaxy", description: "A massive, dynamic galactic society.")
World.create(name: "New York 1985", scale: "City", description: "An alternate universe where Richard Nixon is still president and New York City is crumbling under his policies.")
World.create(name: "London, The Near Future", scale: "City", description: "A dystopian London ruled over by an iron-gripped authoritarian rule.")



