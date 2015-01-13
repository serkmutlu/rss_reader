class RssreaderController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
  end
  
  def show
    @rssitem = Rssreader.find(params[:id])
    url = Rssreader.find(params[:id]).rssaddress
    @feed = Feedjira::Feed.fetch_and_parse url
  end
  
  def new
    @rssreader = Rssreader.new
  end
  
  def create
    @rssreader = Rssreader.create(rss_params)
    if @rssreader.save
      redirect_to rssreader_path(@rssreader)
    else
      redirect_to new_rssreader_path
    end
  end
  
  private
  def rss_params
    params.require(:rssreader).permit(:rssaddress, :friendly_name, :category)
  end
  
end
