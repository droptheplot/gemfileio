class DropStatistics < ActiveRecord::Migration
  def change
    drop_table :statistics
  end
end
