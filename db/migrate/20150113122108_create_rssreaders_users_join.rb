class CreateRssreadersUsersJoin < ActiveRecord::Migration
  def change
    create_table :rssreaders_users, :id => false do |t|
      t.integer "rssreader_id"
      t.integer "user_id"
    end
    add_index :rssreaders_users, ["rssreader_id", "user_id"]
  end
end
