class AddUseridToPostComments < ActiveRecord::Migration[5.1]
  def change
    add_column :post_comments, :user_id, :integer
  end
end
