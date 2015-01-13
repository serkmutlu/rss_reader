class Rssreader < ActiveRecord::Base
  has_and_belongs_to_many :users
  # TO-DO: Re-visit validations
  validates :rssaddress, presence: true
  scope :asc, -> { order('friendly_name ASC') }
end