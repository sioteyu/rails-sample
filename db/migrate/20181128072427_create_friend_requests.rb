class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.integer :target_id
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
