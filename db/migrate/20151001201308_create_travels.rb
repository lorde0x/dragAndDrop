class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
    	t.references :user, index: true, foreign_key: true
		t.string :dep_address
		t.float :dep_lat
		t.float :dep_lng
		t.string :stage_address
		t.float :stage_lat
		t.float :stage_lng
		t.string :arr_address
		t.float :arr_lat
		t.float :arr_lng
		t.datetime :dep_time
		t.datetime :arr_time
		t.datetime :stage_time
		t.string :semi_distance
		t.string :distance
		t.string :way
		t.timestamps null: false
	end
  end
end
