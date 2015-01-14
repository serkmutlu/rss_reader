class RssreaderController < ApplicationController
  before_action :authenticate_user!, :except => 'index'
  
  def index
    if user_signed_in?
      @rss = current_user.rssreaders.asc
    end
  end
  
  def show
    @rss = current_user.rssreaders.asc
    @rssitem = @rss.find(params[:id])
    @feed = Feedjira::Feed.fetch_and_parse @rssitem.rssaddress
  end
  
  def new
    @rss = current_user.rssreaders.asc
    @rssreader = Rssreader.new
  end
  
  def create
    @rssreader = Rssreader.new(rss_params)
    url = Feedbag.find params[:rssreader][:rssaddress]
    @rssreader.rssaddress = url[0]
    @rssreader.users << current_user
    @rssreader.save
    if @rssreader.save
      redirect_to rssreader_path(@rssreader)
      flash[:success] = "You have added #{@rssreader.friendly_name} to your list."
    else
      redirect_to new_rssreader_path
      flash[:alert] = "We couldn't add your feed. Check the address, maybe?"
    end
  end
  
  private
  def rss_params
    params.require(:rssreader).permit(:rssaddress, :friendly_name, :category)
  end
  
end
