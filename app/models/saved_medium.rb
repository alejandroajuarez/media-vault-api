class SavedMedium < ApplicationRecord
  belongs_to :user
  belongs_to :media_entry
  validates :media_entry_id, uniqueness: { scope: :user_id, message: "has already been saved" }

  enum media_status: { saved: "saved", in_progress: "in_progress", archived: "archived" }
end
