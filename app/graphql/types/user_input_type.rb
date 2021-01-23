class Types::UserInputType < Types::BaseInputObject
  description "Attributes to create a user."
  argument :email, String, 'Email of user', required: true
  argument :first_name, String, 'First Name of user', required: true
  argument :last_name, String, 'Last Name of user', required: true
  argument :password, String, 'Password of user', required: true
  argument :password_confirmation, String, 'Password Confirmation', required: true
end
