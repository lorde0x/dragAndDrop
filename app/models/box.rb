class Box < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	belongs_to :user
  	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.dep_address.present? and obj.arr_address.present? }
	after_validation :check_price


	private
	
	def check_price
		if weight < 10 && distance < 100
			price = 8
		elsif weight < 15 && distance < 200
			price = 15
		elsif weight < 20 && distance < 300
			price = 25
		elsif weight > 19 && distance > 299
			price = 30	
		end
	end
	
	def address
		dep_coordinates = Geocoder.search(self.dep_address)
			if !dep_coordinates.empty?
				self.dep_lat = dep_coordinates[0].geometry["location"]["lat"]
				self.dep_long = dep_coordinates[0].geometry["location"]["lng"]
			end
			
		arr_coordinates = Geocoder.search(self.arr_address)
			if !arr_coordinates.empty?
				self.arr_lat = arr_coordinates[0].geometry["location"]["lat"]
				self.arr_long = arr_coordinates[0].geometry["location"]["lng"]
			end
		self.distance = Geocoder::Calculations.distance_between([dep_lat,dep_long], [arr_lat,arr_long])
	end
end
