class Mailer < ApplicationMailer
	def contact_traveler(box, user)
		@user = user
		@box = box
		mail(:to => User.where("id = ?", box).take.email, :subject => "Pay your ticket")
	end
end
