class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.float :lat
      t.float :lng
      t.string :text

      t.timestamps
    end
  end
end
