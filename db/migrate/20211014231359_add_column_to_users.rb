class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_admin, :boolean, default: false

    add_column :users, :address, :string

    add_column :users, :username, :string

    add_column :users, :telephone, :string
  end
end
