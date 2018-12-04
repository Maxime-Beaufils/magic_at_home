class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :place
      t.date :date
      t.text :description
      t.references :user_creator, foregin_key: true
      t.references :user_opponent, foregin_key: true
      t.string :game_format
      t.timestamps
    end
  end
end
