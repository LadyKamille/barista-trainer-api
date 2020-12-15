# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create basic roasts
Roast.create(name: 'Light')
Roast.create(name: 'Medium')
Roast.create(name: 'Dark')

# Create basic grinds
Grind.create(name: 'Coarse')
Grind.create(name: 'Medium')
Grind.create(name: 'Fine')

# Create basic Tasting Notes
TastingNote.create(name: 'Chocolate')
TastingNote.create(name: 'Caramel')
TastingNote.create(name: 'Nutty')
