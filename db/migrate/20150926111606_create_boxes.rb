class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.references :user, index: true, foreign_key: true
      t.float :weight
      t.string :description
      t.string :image
      t.string :dep_address
      t.string :dep_long
      t.string :dep_lat
      t.string :arr_address
      t.string :arr_lat
      t.string :arr_long
      t.datetime :expiration
      t.float :distance

      t.timestamps null: false
    end
  end
end
