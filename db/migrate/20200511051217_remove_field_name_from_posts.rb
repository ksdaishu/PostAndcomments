class RemoveFieldNameFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :title, :string
    remove_column :posts, :user_id, :integer
  end
end
