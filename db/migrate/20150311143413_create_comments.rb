class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :idea, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :ideas
    add_foreign_key :comments, :users
  end
end