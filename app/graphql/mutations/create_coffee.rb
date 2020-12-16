class Mutations::CreateCoffee < Mutations::BaseMutation
  argument :name, String, required: true
  argument :grind_id, Integer, required: false
  argument :roast_id, Integer, required: false
  argument :roasted_on, GraphQL::Types::ISO8601DateTime, required: false
  argument :tasting_notes_id, Integer, required: false

  field :coffee, Types::CoffeeType, null: false
  field :errors, [String], null: false

  def resolve(name:, grind_id: nil, roast_id: nil, roasted_on: nil, tasting_notes_id: nil)
    coffee = Coffee.create!(
      name: name,
      grind_id: grind_id,
      roast_id: roast_id,
      roasted_on: roasted_on,
      tasting_notes_id: tasting_notes_id,
    )
    if coffee.save
      {
        coffee: coffee,
        errors: []
      }
    else
      {
        coffee: nil,
        errors: coffee.errors.full_messages
      }
    end
  end
end
