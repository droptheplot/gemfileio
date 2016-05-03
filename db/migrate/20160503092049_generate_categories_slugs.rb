class GenerateCategoriesSlugs < ActiveRecord::Migration
  def change
    Category.all.each do |category|
      category.send(:generate_slug)
      category.save
    end
  end
end
