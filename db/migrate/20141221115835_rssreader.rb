class Rssreader < ActiveRecord::Migration
  def change
    create_table :rssreader do |t|
      t.string :rssaddress
      t.timestamp
    end
  end
end
