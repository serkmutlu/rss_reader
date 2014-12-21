class CreateRsslists < ActiveRecord::Migration
  def change
    create_table :rsslists do |t|
      t.string :name
      t.string :rssaddress

      t.timestamps
    end
  end
end
