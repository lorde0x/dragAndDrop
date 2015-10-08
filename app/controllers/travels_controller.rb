class TravelsController < ApplicationController
	before_action :set_travel, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	# GET /travels
	# GET /travels.json
	def index
		@travels = Travel.all
	end

	# GET /travels/1
	# GET /travels/1.json
	def show
	end

	# GET /travels/new
	def new
		@travel = Travel.new
	end

	# GET /travels/1/edit
	def edit
	end

	# POST /travels
	# POST /travels.json
	def create
	@travel = Travel.new(travel_params)
	@travel.user_id = current_user.id
	
		respond_to do |format|
			if @travel.save
				format.html { redirect_to search_boxes_url, notice: 'Travel was successfully created.' }
				format.json { render :show, status: :created, location: @travel }
			else
				format.html { render :new }
				format.json { render json: @travel.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /travels/1
	# PATCH/PUT /travels/1.json
	def update
	respond_to do |format|
			if @travel.update(travel_params)
				format.html { redirect_to @travel, notice: 'Travel was successfully updated.' }
				format.json { render :show, status: :ok, location: @travel }
			else
				format.html { render :edit }
				format.json { render json: @travel.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /travels/1
	# DELETE /travels/1.json
	def destroy
	@travel.destroy
		respond_to do |format|
			format.html { redirect_to travels_url, notice: 'Travel was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_travel
		@travel = Travel.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def travel_params
		params.require(:travel).permit(:user_id, :dep_address, :dep_lat, :dep_lng, :stage_address, :stage_lat, :stage_lng, :arr_address, :arr_lat, :arr_lng, :dep_time, :arr_time, :stage_time, :semi_distance, :semi_time, :distance, :time, :way)
	end
end
