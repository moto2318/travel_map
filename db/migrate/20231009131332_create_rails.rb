class CreateRails < ActiveRecord::Migration[6.1]
  def change
    create_table :rails do |t|
      t.string :g
      t.string :scaffold
      t.string :map
      t.float :lat
      t.float :lng
      t.string :text

      t.timestamps
    end
  end
end
