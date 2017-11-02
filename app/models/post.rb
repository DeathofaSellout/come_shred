class Post < ApplicationRecord
  has_many :post_comments
  belongs_to :user
end
