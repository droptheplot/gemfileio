class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :password_hash
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end

    add_index :users, :email
    add_index :users, :provider
    add_index :users, :uid
  end
end
