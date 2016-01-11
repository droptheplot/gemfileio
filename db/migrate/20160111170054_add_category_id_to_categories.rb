class AddCategoryIdToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :category, index: true, foreign_key: true
  end
end
