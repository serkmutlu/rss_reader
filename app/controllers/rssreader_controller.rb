class RssreaderController < ApplicationController
  def index
  end
  
  def show
    url = Rssreader.find(params[:id]).rssaddress
    @feed = Feedjira::Feed.fetch_and_parse url
  end
  
end
