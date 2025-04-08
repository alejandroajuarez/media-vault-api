class CreateSavedMedia < ActiveRecord::Migration[8.0]
  def change
    create_table :saved_media do |t|
      t.integer :user_id
      t.integer :media_id
      t.string :media_status
      t.string :rating
      t.string :progress
      t.boolean :favorite

      t.timestamps
    end
  end
end
