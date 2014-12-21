class Rssreader < ActiveRecord::Base
  self.table_name = "rssreader"
  validates :rssaddress, presence: true
end