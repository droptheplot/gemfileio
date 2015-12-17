class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :projects_count, null: false, default: 0

      t.timestamps null: false
    end
  end
end
