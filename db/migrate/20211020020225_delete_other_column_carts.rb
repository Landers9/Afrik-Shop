class DeleteOtherColumnCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :number_product
  end
end
