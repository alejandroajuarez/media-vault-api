class SavedMedium < ApplicationRecord
  belongs_to :user
  belongs_to :media_entry
  validates :media_entry_id, uniqueness: { scope: :user_id, message: "has already been saved" }
end
