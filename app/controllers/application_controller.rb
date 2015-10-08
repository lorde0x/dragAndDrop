class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	include HttpAcceptLanguage::AutoLocale

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :email, :password, :password_confirmation, :first_name, :last_name, :place, :image, :identity_card, :phone_number) }
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :image, :identity_card, :phone_number) }
	end
end
