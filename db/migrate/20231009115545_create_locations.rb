class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :latitude
      t.string :longitude
      t.string :postal_code
      t.string :state_province
      t.string :city_town_village

      t.timestamps
    end
  end
end
