class CreateTagses < ActiveRecord::Migration[6.1]
  def change
    create_table :tagsses do |t|
      t.text :tag_new

      t.timestamps
    end
  end
end
