class AddRuleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :place, :string
    add_column :users, :place_lat, :string
    add_column :users, :place_long, :string
    add_column :users, :phone_number, :string, limit: 10, default: 'vuoto'
    add_column :users, :image, :string, default: 'vuoto'
    add_column :users, :identity_card, :string, default: 'vuoto'
    add_column :users, :permission_level, :integer, default: 100        
  end
end
