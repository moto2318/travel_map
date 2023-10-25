class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.text :name, null:false

      t.timestamps
    end
    
    add_index :tags, :name, unique:true, length: 50
    
  end
end
