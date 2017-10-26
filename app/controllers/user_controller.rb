class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find_by_id(params[:id])
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :gender, :sports, :self_description, :age, :username)
  end
end
