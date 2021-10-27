class AddColumnFavory < ActiveRecord::Migration[5.2]
  def change
    add_reference :favories, :user, foreign_key: true
    add_index :favories, [:user_id, :product_id], unique:true
  end
end
