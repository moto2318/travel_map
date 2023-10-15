class CreateMapTags < ActiveRecord::Migration[6.1]
  def change
    create_table :map_tags do |t|
      t.references :map, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end

    add_index :tags, [:map_id,:tag_id],unique: true
  end
end
