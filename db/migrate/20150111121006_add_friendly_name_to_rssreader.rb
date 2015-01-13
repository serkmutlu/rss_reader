class AddFriendlyNameToRssreader < ActiveRecord::Migration
  def change
    add_column :rssreader, :friendly_name, :string
  end
end
