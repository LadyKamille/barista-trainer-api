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
Grind.create(name: 'Whole')

# Create basic Tasting Notes
TastingNote.create(name: 'Chocolate')
TastingNote.create(name: 'Caramel')
TastingNote.create(name: 'Nutty')

Coffee.create(
  name: "Bandit",
  grind_id: 1,
  roast_id: 1,
  roasted_on: "2020-12-15T06:42:10.492Z",
  tasting_notes_id: 1,
)
