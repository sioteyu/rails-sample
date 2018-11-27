class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :name
      t.boolean :isAdmin

      t.timestamps
    end
  end
end
