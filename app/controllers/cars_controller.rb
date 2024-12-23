class CarsController < ApplicationController
  before_action :find_car, only: [ :show, :edit, :update, :destroy ]

  def index
    @cars = Car.all.paginate(page: params[:page], per_page: 8)
  end

  def show
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to @car, notice: "¡Vehículo editado satisfactoriamente!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to @car, notice: "¡Vehículo creado satisfactoriamente!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path, alert: "¡Vehículo eliminado satisfactoriamente!"
  end

private

  def car_params
    params.require(:car).
        permit(:plate_number, :model, :year)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
