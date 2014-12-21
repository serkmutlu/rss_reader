class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :heading
      t.text :body
      t.string :author
      t.integer :rsslist_id

      t.timestamps
    end
    
    add_index :articles, :rsslist_id
  end
end
