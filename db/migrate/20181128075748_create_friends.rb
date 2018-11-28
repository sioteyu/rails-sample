class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :user_1
      t.integer :user_2

      t.timestamps
    end
  end
end
