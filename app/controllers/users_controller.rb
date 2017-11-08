class UsersController < ApplicationController
  before_action :is_current_user, only: [:show]

  def index
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      login(@user)
      flash[:success] = "Successfully logged in."
      redirect_to @user
    else
      flash[:error] = "Incorrect email or password."
      redirect_to root_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @users = User.all
  end

  def update
    @user = User.find_by_id(session[:user_id])
    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    if current_user.id != @post.user_id
      redirect_to post_path(@post)
    end
  end

  def destroy
    user = User.find_by_id(params[:user_id])
    user.destroy
    redirect_to root_url
  end

  private

  def is_current_user
    if current_user.id.to_s != params[:id]
      redirect_to user_path(current_user)
    end

  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :gender, :sports, :self_description, :age, :username, :image)
  end
end
