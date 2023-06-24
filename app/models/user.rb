class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable, :validatable,
         :recoverable, :rememberable, :timeoutable, :lockable, :trackable,
         :omniauthable, omniauth_providers: [:facebook]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20] # give it a random password
    end
  end
end
