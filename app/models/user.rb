class User < ApplicationRecord
  has_many :media_entries, through: :saved_media
  has_many :saved_media
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
