class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :registration_code, :string
    add_column :users, :postal_code, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end