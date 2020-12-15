module Types
  class CoffeeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :roast_id, Integer, null: false
    field :roasted_on, GraphQL::Types::ISO8601DateTime, null: true
    field :grind_id, Integer, null: false
    field :tasting_notes_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
