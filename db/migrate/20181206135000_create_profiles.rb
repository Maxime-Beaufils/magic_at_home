class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foregin_key: true
      t.string :username
      t.string :country
      t.string :city
      t.integer :zip
      t.text :street
      t.string :favorite_format
      t.string :favorite_color
      t.text :bio
      t.integer :avatar_id
      t.float :longitude
      t.float :latitude
      t.timestamps
    end
  end
end
