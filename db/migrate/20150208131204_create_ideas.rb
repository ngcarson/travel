class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :Idea
      t.string :Destination
      t.date :Start
      t.date :End
      t.string :Tags

      t.timestamps null: false
    end
  end
end