class RenameRssReaderTable < ActiveRecord::Migration
  def change
    rename_table :rssreader, :rssreaders
  end
end
