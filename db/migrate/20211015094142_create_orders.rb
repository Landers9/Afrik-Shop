class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.integer :qt_product
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 0
      
      t.timestamps
    end
  end
end
