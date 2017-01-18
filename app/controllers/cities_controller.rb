class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :update, :destroy]

  def index
    @cities = City.all
    #render json: @cities
  end

  def show
    #render json: @city
  end

  def create
    @city = City.new(city_params)

    if @city.save
      #render json: @city, status: :created, location: @city
      render :show, status: :created, location: @city
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /cities/1
  # # PATCH/PUT /cities/1.json
  # def update
  #   @city = City.find(params[:id])
  #
  #   if @city.update(city_params)
  #     head :no_content
  #   else
  #     render json: @city.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /cities/1
  # # DELETE /cities/1.json
  # def destroy
  #   @city.destroy
  #
  #   head :no_content
  # end

  private

    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name)
    end
end
