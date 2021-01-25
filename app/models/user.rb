class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: %i[facebook]

  # add new roles to the end
  enum role: %i[customer admin]

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

  after_initialize :setup_new_user, if: :new_record?

  def name
    [first_name, last_name].join(' ').strip
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.name.split[0] || ""
      user.last_name = auth.info.name.split[1] || ""
      #user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

private
  def setup_new_user
    self.role ||= :customer
  end

  def password_required_for_action
    # Add any changes that you want to require a password for. eg:
    # self.username_changed? or
    #   self.id_changed? or
    #   self.email_changed? or
    #   self.first_name_changed? or
    #   self.last_name_changed?
    if self.encrypted_password_changed?
      return true
    end
    false
  end
end
