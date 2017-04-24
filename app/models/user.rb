class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable    
  devise :omniauthable, :omniauth_providers => [:github, :google_oauth2]
  validates :name, :phone, :address, :blood_group, :email, presence: true

  def self.from_omniauth_github(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email || "#{auth.info.nickname}@github.com"
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.from_omniauth_google_oauth2(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email || "#{auth.info.name}@gmail.com"
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.search(search)
    where("blood_group LIKE ?", "%#{search}%")
  end

  after_create :welcome_email

  def welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
