class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
