class AddCategoryToRssreader < ActiveRecord::Migration
  def change
    add_column :rssreader, :category, :string
  end
end
