class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.references :customer, null: false, foreign_key: true
      t.float :lat
      t.float :lng
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
