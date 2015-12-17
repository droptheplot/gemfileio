class AddActiveToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :active, :boolean, null: false, default: false
  end
end
