class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :active_projects_count, null: false, default: 0
      t.integer :inactive_projects_count, null: false, default: 0

      t.timestamps null: false
    end
  end
end
