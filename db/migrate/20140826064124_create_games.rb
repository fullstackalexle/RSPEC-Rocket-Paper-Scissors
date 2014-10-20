class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :computer_throw
      t.string :user_throw
      t.string :winner
      t.timestamps
    end
  end
end
