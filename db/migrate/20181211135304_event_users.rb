class EventUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :EventUsers do |t|
      t.references :user_participant, foregin_key: true
      t.references :event, foregin_key: true
      t.timestamps
    end
  end
end
