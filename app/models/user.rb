class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable, :confirmable
		
	has_one :account
	has_many :boxes
	has_many :travels
	validates :place, :first_name, :last_name, presence: true
	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.place.present? }
	
	private 
	
	def address
		place_coordinates = Geocoder.search(self.place)
			if !place_coordinates.empty?
				self.place_lat = place_coordinates[0].geometry["location"]["lat"]
				self.place_long = place_coordinates[0].geometry["location"]["lng"]
			end
	end
end
