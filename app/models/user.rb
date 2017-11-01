class User < ApplicationRecord
  acts_as_messageable

  has_many :spots
  has_secure_password

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  validates :username, presence: true, uniqueness: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { in: 6..20 }

  def name
    "User #{id}"
  end

  def mailboxer_email(object)
    nil
  end

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
