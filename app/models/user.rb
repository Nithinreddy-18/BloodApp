class User < ApplicationRecord
  #attr_accessor :name, :email, :phone, :address, :blood_group
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable    
  devise :omniauthable, :omniauth_providers => [:github, :google_oauth2, :twitter]
  validates :name, :email, :phone, :address, :blood_group, presence: true
  after_create :welcome_email

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  def welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

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
      user.name = auth.name
      user.email = auth.info.email || "#{auth.info.name}@gmail.com"
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.from_omniauth_twitter(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email || "#{auth.info.name}@twitter.com"
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.search(search)
    where("blood_group LIKE ?", "%#{search}%")
  end

end
