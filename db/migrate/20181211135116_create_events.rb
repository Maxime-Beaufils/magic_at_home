class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :place
      t.string :color
      t.text :description
      t.references :user_event_creator, foregin_key: true
      t.timestamps
    end
  end
end
