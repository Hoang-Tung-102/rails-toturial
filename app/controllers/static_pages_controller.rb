class StaticPagesController < ApplicationController
  def home
	  if logged_in?
  		@micropost = current_user.microposts.build
  		@feed_items = current_user.feed.paginate(page: params[:page])
      # @comments=[]
      # if @feed_items!=nil
      #   @feed_items.each do |feed_items|
      #   @comments += feed_items.comments
      #   byebug
      # 	end
      # end
    end
  end

  def help
  end
  def about
  end
  def contact
  end
end
