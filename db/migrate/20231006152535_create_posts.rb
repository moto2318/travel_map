class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :title
      t.text :details
      t.string :latitude
      t.string :longitude
      t.string :postal_code
      t.string :state_province
      t.string :city_town_village

      t.timestamps
    end
  end
end
