class AddTimestampToRssreader < ActiveRecord::Migration
  def change
    add_column "rssreader", "created_at", :datetime
    add_column "rssreader", "updated_at", :datetime
  end
end
