class RemoveUserIdFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_index :events, :user_id
  end
end
