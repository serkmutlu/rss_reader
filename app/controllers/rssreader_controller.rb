class RssreaderController < ApplicationController
  before_action :authenticate_user!, :except => 'index'
  
  def index
    # Check to see if the user is signed in, don't show an RSS list on sidebar if not signed in.
    if user_signed_in?
      @rss = current_user.rssreaders.asc
    end
  end
  
  def show
    @rss = current_user.rssreaders.asc
    @rssitem = @rss.find(params[:id])
    # Use Feedjira gem to fetch and parse the feed
    @feed = Feedjira::Feed.fetch_and_parse @rssitem.rssaddress
  end
  
  def new
    @rss = current_user.rssreaders.asc
    @rssreader = Rssreader.new
  end
  
  def create
    @rssreader = Rssreader.new(rss_params)
    # Use Feedbag gem to get the RSS link of a URL
    url = Feedbag.find params[:rssreader][:rssaddress]
    @rssreader.rssaddress = url[0]
    # The RSS feed belongs to current user
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
