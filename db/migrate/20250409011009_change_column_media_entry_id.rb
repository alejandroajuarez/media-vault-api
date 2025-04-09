class ChangeColumnMediaEntryId < ActiveRecord::Migration[8.0]
  def change
    rename_column :saved_media, :media_id, :media_entry_id 
  end
end
