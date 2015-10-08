class HomeController < ApplicationController
	def index
	end
  
	def search_travel 
		user_boxes = Box.where('user_id = ? and expiration > ?', current_user.id, Time.now).take
			if !user_boxes.nil?
				some_travels = Travel.near([user_boxes.dep_lat, user_boxes.dep_long], 50, latitude: :dep_lat, longitude: :dep_lng)
				travels = some_travels.near([user_boxes.arr_lat, user_boxes.arr_long], 50, latitude: :arr_lat,  longitude: :arr_lng) 
				if !travels.nil?
					@travels = travels
				end
			end
	end
  
  	def search_boxes
		user_travels = Travel.where('user_id = ? and dep_time > ?', current_user.id, Time.now).take
			if !user_travels.nil?
 				some_boxes = Box.near([user_travels.dep_lat, user_travels.dep_lng], 50, latitude: :dep_lat, longitude: :dep_long)
 				boxes = some_boxes.near([user_travels.arr_lat, user_travels.arr_lng], 50, latitude: :arr_lat,  longitude: :arr_long) + some_boxes.near([user_travels.stage_lat, user_travels.stage_lng], 50, latitude: :arr_lat, longitude: :arr_long)
		 		if !boxes.nil?
						@boxes = boxes
				end
			end
	end
end
