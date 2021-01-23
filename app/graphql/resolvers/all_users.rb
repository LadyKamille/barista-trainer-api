class Resolvers::AllUsers < GraphQL::Schema::Resolver

  type [Types::UserType], null: false
  description 'Returns all users'

  def resolve
    if context[:current_user].admin?
      User.all
    else
      false
    end
  end

end
