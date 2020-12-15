module Types
  class MutationType < Types::BaseObject
    field :create_coffee, mutation: Mutations::CreateCoffee
  end
end
