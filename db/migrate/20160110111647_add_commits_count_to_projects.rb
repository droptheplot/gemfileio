class AddCommitsCountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :commits_count, :jsonb, null: false, default: '[]'
  end
end
