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

Story.create(title: "Game of Thrones", summary: "Politics, blood and dragons.", user_id: 1)
Story.create(title: "Mass Effect 2", summary: "A galactic soap opera!", user_id: 2)
Story.create(title: "Star Wars", summary: "A band of rebels fight an evil empire.", user_id: 3)
Story.create(title: "Watchmen", summary: "A realistic take on superhero mythology.", user_id: 4)
Story.create(title: "V for Vendetta", summary: "An anarchistic vigilante faces down an authoritarian government.", user_id: 4)

World.create(name: "Westeros", scale: "Continent", description: "A gritty medieval landscape with seven kingdoms ruled under one banner.", user_id: 1)
World.create(name: "Essos", scale: "Continent", description: "The eastern continent beyond the narrow sea.", user_id: 1)
World.create(name: "The Milky Way", scale: "Galaxy", description: "A massive, dynamic galactic society.", user_id: 2)
World.create(name: "A Galaxy, Far, Far Away", scale: "Galaxy", description: "A massive, dynamic galactic society.", user_id: 3)
World.create(name: "New York 1985", scale: "City", description: "An alternate universe where Richard Nixon is still president and New York City is crumbling under his policies.", user_id: 4)
World.create(name: "London, The Near Future", scale: "City", description: "A dystopian London ruled over by an iron-gripped authoritarian rule.", user_id: 4)

Character.create(
    world_id: 1,
    story_id: 1,
    name: "Jon Snow",
    role: "Main Character",
    age: 19,
    gender: "Male",
    species: "N/A",
    job: "Night's Watch",
    physical: "Handsome",
    description: "Brooding",
    motivation: "But who is my mom?"
)

Character.create(
    world_id: 1,
    story_id: 1,
    name: "Lady Brienne",
    role: "Supporting Character",
    age: 32,
    gender: "Female",
    species: "N/A",
    job: "Knight and Warrior",
    physical: "Enormous and imposing, but beautiful.",
    description: "Noble",
    motivation: "To become a real knight."
)

Character.create(
    world_id: 2,
    story_id: 2,
    name: "Thane Krios",
    role: "Supporting Character",
    age: 45,
    gender: "Male",
    species: "Grell",
    job: "Master Assasin",
    physical: "Lythe and Agile",
    description: "Reverant",
    motivation: "To achieve penance for the deaths he caused."
)

Character.create(
    world_id: 2,
    story_id: 2,
    name: "Liara T'soni",
    role: "Supporting Character",
    age: 106,
    gender: "Non-Binary",
    species: "Asari",
    job: "Architect and Information Broker",
    physical: "Bookish, but lovely.",
    description: "Socially awkward and obsessive over knowledge.",
    motivation: "To learn more about the Protheans."
)

Character.create(
    world_id: 3,
    story_id: 3,
    name: "Darth Vader",
    role: "Antagonist",
    age: 45,
    gender: "Male",
    species: "Unknown",
    job: "Dark Lord of the Sith",
    physical: "Terrifying mask, long cape, imposing.",
    description: "Stoic, Violent, Unforgiving",
    motivation: "Destroy the Rebels."
)

Character.create(
    world_id: 3,
    story_id: 3,
    name: "Han Solo",
    role: "Supporting Character",
    age: 32,
    gender: "Male",
    species: "Human",
    job: "Smuggler",
    physical: "Tall, handsome, roguish.",
    description: "Selfish,  but kind.",
    motivation: "Pay off Jabba the Hutt."
)

Character.create(
    world_id: 4,
    story_id: 4,
    name: "Night Owl",
    role: "Main Character",
    age: 53,
    gender: "Male",
    species: "N/A",
    job: "Retired Superhero",
    physical: "Round-faced and unkept.",
    description: "Sad and longing for the old days.",
    motivation: "Keep his head down and go unnoticed."
)

Character.create(
    world_id: 5,
    story_id: 5,
    name: "Evie",
    role: "Protagonist",
    age: 26,
    gender: "Female",
    species: "N/A",
    job: "Production Assistant for the Local News",
    physical: "Petite and pretty.",
    description: "Naive, but strong.",
    motivation: "To survive her day to day existence."
)