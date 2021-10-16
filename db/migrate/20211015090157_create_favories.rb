class CreateFavories < ActiveRecord::Migration[5.2]
  def change
    create_table :favories do |t|
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
