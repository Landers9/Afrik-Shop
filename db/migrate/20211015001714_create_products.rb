class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :image
      t.references :category, foreign_key: true
      t.integer :price
      t.timestamps
    end
  end
end
