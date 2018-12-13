class User < ApplicationRecord

  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one :profile
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  devise :omniauthable, omniauth_providers: [:facebook]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
end

def self.from_facebook(auth)
  where(facebook_id: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.username = auth.info.name
    user.password = Devise.friendly_token[0,20]
    parse_name(user, auth.info.name) # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
    user.skip_confirmation!
  end
end
  end
