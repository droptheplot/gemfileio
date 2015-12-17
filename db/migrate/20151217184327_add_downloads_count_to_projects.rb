class AddDownloadsCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :downloads_count, :integer, null: false, default: 0
  end
end
