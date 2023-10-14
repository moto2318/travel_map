class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      #名前
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :nick_name
      
      #登録パスとアドレス
      t.string :email
      t.string :encryted_password
      
      t.boolean :is_deleted, default: false 
      
      #(true:公開、false:非公開)
      t.boolean :public, default: true
      

      t.timestamps
    end
  end
end
