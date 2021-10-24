class AddColumnFavory < ActiveRecord::Migration[5.2]
  def change
    add_reference :favories, :user, foreign_key: true
  end
end
