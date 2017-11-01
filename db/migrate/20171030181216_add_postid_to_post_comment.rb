class AddPostidToPostComment < ActiveRecord::Migration[5.1]
  def change
    add_column :post_comments, :post_id, :integer
  end
end
