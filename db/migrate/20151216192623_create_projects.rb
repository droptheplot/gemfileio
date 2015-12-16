class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :owner
      t.string :repo
      t.text :description
      t.integer :stars_count, null: false, default: 0
      t.integer :forks_count, null: false, default: 0
      t.integer :contributors_count, null: false, default: 0
      t.integer :views_count, null: false, default: 0

      t.timestamps null: false
    end
  end
end
