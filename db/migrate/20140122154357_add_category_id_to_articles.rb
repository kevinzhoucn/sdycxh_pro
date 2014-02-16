class AddCategoryIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :category_id, :integer
    add_column :articles, :sub_category_id, :integer
  end
end
