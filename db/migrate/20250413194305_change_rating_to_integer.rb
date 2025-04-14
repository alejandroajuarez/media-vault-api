class ChangeRatingToInteger < ActiveRecord::Migration[8.0]
  def up
    change_column :saved_media, :rating, 'integer USING CAST(rating AS integer)'
  end

  def down
    change_column :saved_media, :rating, :string
  end
end
