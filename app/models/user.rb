class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: %i[facebook]

  PASSWORD_REQUIREMENTS = /\A
      (?=.{8,}) # at least 8 chars long
      (?=.*\d) # at least one number
      (?=.*[a-z]) # at least one lowercase letter
      (?=.*[A-Z]) # at least one uppercase letter
      (?=.*[[:^alnum:]]) # at least one symbol
    /x

  validates :password, format: PASSWORD_REQUIREMENTS, if: :password_required_for_action
  validates :email, presence: true, length: { maximum: 255 } # Validatable is already checking that the email is valid and unique
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }

  def name
    [first_name, last_name].join(' ').strip
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.name.split[0] || ""
      user.last_name = auth.info.name.split[1] || ""
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
