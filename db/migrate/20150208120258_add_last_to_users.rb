class AddLastToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
  end
end
