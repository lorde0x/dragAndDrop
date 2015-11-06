class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :image
      t.string :phone_number, limit: 10
      t.string :identity_card

      t.timestamps null: false
    end
  end
end
