class AddReadmeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :readme, :text
  end
end
