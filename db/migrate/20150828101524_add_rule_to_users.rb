class AddRuleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rule, :boolean, :default => false
  end
end
