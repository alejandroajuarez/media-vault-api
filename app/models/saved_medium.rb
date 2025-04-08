class SavedMedium < ApplicationRecord
  belongs to :user
  belongs to :media_entry
end
