class SavedMedium < ApplicationRecord
  belongs_to :user
  belongs_to :media_entry
end
