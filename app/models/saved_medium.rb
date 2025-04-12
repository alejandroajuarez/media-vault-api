class SavedMedium < ApplicationRecord
  belongs_to :user
  belongs_to :media_entry

  STATUSES = %w[saved in_progress archived].freeze

  validates :media_status, inclusion: { in: STATUSES }
  validates :media_entry_id, uniqueness: { scope: :user_id, message: "has already been saved" }

  scope :saved, -> { where(media_status: 'saved') }
  scope :in_progress, -> { where(media_status: 'in_progress') }
  scope :archived, -> { where(media_status: 'archived') }
  
  def saved?
    media_status == "saved"
  end
  
  def in_progress?
    media_status == "in_progress"
  end
  
  def archived?
    media_status == "archived"
  end
end
