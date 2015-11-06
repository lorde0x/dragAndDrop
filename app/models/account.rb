class Account < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	belongs_to :user
	validates :image, :identity_card, :phone_number, presence: true
end
