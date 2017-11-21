class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: [:show, :edit, :update, :destroy]

  def index
    @post_comments = PostComment.all
  end

  def show
  end

  def new
    @post_comment = PostComment.new
  end

  def edit
  end

  def create
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user = current_user
    @post_comment.user_id = current_user.id
    @post_comment.save
    redirect_to posts_path
  end

  def update
    respond_to do |format|
      if @post_comment.update(post_comment_params)
        format.html { redirect_to @post_comment, notice: 'Post comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_comment }
      else
        format.html { render :edit }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post_comment.destroy
    redirect_to posts_path
  end

  private
    def set_post_comment
      @post_comment = PostComment.find(params[:id])
    end

    def post_comment_params
      params.require(:post_comment).permit(:comment, :post_id, :user_id)
    end
end
