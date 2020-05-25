class CommentsController < ApplicationController
   before_action :logged_in_user
   before_action :find_micropost , only: :create
  # before_action :correct_user, only: :destroy
  def create
    # @micropost = Micropost.find(params[:id])
    # @comment = @micropost.comments
     @comment = current_user.comments.build(comment_params)
     #comments la bang muon build


    if @comment.save
      flash[:success] = "comment created!"
      redirect_to micropost_path @micropost
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  def update
    @comment = comment.find(params[:id])
    if @comment.update(comment_params)
    # Handle a successful update.
    redirect_to @comment
    else
      render 'edit'
    end
  end
  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted"
     redirect_to request.referrer || root_ur
  end
  private
    def comment_params
      params.require(:comment).permit(:content, :micropost_id, :user_id)
    end
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end

    def find_micropost
      @micropost = Micropost.find_by id: comment_params[:micropost_id]
    end
end
