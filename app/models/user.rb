class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[github facebook]

  has_one :billing, dependent: :destroy
  has_one :shipping, dependent: :destroy
  has_one :picture, dependent: :destroy

  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :picture, allow_destroy: true

  def self.from_omniauth(access_token)
    email = access_token.info['email'].downcase
    user = User.find_by(email: email)

    user ||= User.new(
      email: email,
      password: Devise.friendly_token[0, 20]
    )
    user.skip_confirmation!
    user.save
    user
  end
end
