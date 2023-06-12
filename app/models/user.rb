class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[github facebook google_oauth2]

  has_one :billing, dependent: :destroy
  has_one :shipping, dependent: :destroy

  has_one :user_picture, as: :picturable, dependent: :destroy

  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy

  accepts_nested_attributes_for :user_picture, allow_destroy: true

  def self.from_omniauth(access_token)
    email = access_token.info['email'].downcase
    user = User.find_by(email:)

    user ||= User.new(
      email:,
      password: Devise.friendly_token[0, 20]
    )
    user.skip_confirmation!
    user.save
    user
  end
end
