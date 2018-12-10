class CreateGameComments < ActiveRecord::Migration[5.2]
  def change
    create_table :game_comments do |t|
      t.string :username
      t.text :body
      t.references :game
      t.timestamps
    end
  end
end
