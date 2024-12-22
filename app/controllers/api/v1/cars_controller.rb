class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: [ :show, :update, :destroy ]
  skip_before_action :verify_authenticity_token

  # GET /api/v1/cars
  def index
    @cars = Car.all
    render json: @cars
  end

  # GET /api/v1/cars/1
  def show
    render json: @car
  end

  # POST /api/v1/cars
  def create
    @car = Car.new(car_params)
    if @car.save
      render json: @car, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/cars/1
  def update
    if @car.update(car_params)
      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/cars/1
  def destroy
    @car.destroy
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:plate_number, :model, :year)
  end
end
