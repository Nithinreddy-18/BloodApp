class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  validates :name, :phone, :address, :blood_group, presence: true

  def self.search(search)
    where("blood_group LIKE ?", "%#{search}%")
  end
end
