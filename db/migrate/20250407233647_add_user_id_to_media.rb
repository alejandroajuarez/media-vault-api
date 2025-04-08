class AddUserIdToMedia < ActiveRecord::Migration[8.0]
  def change
    add_column :media_entries, :user_id, :integer
  end
end
