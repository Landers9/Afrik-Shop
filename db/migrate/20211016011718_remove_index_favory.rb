class RemoveIndexFavory < ActiveRecord::Migration[5.2]
  def change
    remove_index :favories, :product_id
    add_index :favories, :product_id, :unique => true
  end
end
