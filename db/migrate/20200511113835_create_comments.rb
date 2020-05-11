class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post, foreign_key: true
      t.references :user, index: true

      t.timestamps
    end
    add_foreign_key :comments, :users, column: :user_id
  end
end
