class AddAddressToMaps < ActiveRecord::Migration[6.1]
  def change
    add_column :maps, :address, :string
  end
end
