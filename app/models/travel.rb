class Travel < ActiveRecord::Base
	belongs_to :user
	validates :dep_address, :arr_address, :presence => true
	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.dep_address.present? and obj.arr_address.present? }
	
	private
	
	def address
		dep_coordinates = Geocoder.search(self.dep_address)
			if !dep_coordinates.empty?
				self.dep_lat = dep_coordinates[0].geometry["location"]["lat"]
				self.dep_lng = dep_coordinates[0].geometry["location"]["lng"]
			end
			
			if !self.stage_address.empty?
				stage_coordinates = Geocoder.search(self.stage_address)
					if !stage_coordinates.empty?
						self.stage_lat = stage_coordinates[0].geometry["location"]["lat"]
						self.stage_lng = stage_coordinates[0].geometry["location"]["lng"]
					end
			end
			
		arr_coordinates = Geocoder.search(self.arr_address)
			if !arr_coordinates.empty?
				self.arr_lat = arr_coordinates[0].geometry["location"]["lat"]
				self.arr_lng = arr_coordinates[0].geometry["location"]["lng"]
			end
			
			if !self.stage_address.empty?
				self.semi_distance = Geocoder::Calculations.distance_between([dep_lat,dep_lng], [stage_lat,stage_lng])
				self.distance = Geocoder::Calculations.distance_between([stage_lat,stage_lng], [arr_lat,arr_lng])
			else 
				self.distance = Geocoder::Calculations.distance_between([dep_lat,dep_lng], [arr_lat,arr_lng])
			end		
	end
end
