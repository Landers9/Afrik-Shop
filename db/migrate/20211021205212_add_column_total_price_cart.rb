class AddColumnTotalPriceCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :total_price, :integer, null:true, default:0
  end
end
