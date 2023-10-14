class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.references :customer, null: false, foreign_key: true
      t.text :tag_new

      t.timestamps
    end
  end
end
