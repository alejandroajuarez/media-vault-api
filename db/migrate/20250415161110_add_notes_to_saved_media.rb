class AddNotesToSavedMedia < ActiveRecord::Migration[8.0]
  def change
    add_column :saved_media, :notes, :text
  end
end
