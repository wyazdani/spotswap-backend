class AddAddressToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :address, :string
  end
end
