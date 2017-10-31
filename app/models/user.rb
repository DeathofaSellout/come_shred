class User < ApplicationRecord
  has_many :spots
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { in: 6..20 }

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
