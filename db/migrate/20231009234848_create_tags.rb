class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.references :customer, null: false, foreign_key: true
      t.text :name, null:false

      t.timestamps
    end
    
    add_index :tags, :name, unique:true, length: 50
    
  end
end
