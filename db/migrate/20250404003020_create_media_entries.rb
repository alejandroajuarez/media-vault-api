class CreateMediaEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :media_entries do |t|
      t.string :title
      t.string :description
      t.string :media_type
      t.string :image_url
      t.string :creator

      t.timestamps
    end
  end
end
