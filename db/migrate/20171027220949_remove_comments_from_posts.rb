class RemoveCommentsFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :comment, :string
  end
end
