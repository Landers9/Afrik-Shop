class DeleteColumnCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :sum_price
  end
end
