module Types
  class MutationType < Types::BaseObject
    # Coffee
    field :create_coffee, mutation: Mutations::CreateCoffee

    # User Authentication
    field :login, mutation: Mutations::User::Login
    field :logout, mutation: Mutations::User::Logout
    field :sign_up, mutation: Mutations::User::SignUp
  end
end
