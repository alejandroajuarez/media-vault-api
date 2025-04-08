class MediaEntry < ApplicationRecord
  has_many :saved_media
  has_many :users, through: :saved_media
end
