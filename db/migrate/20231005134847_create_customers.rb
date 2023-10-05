class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :email
      t.string :encryted_password
      t.boolean :is_deleted
      t.boolean :public
      t.string :nick_name

      t.timestamps
    end
  end
end
