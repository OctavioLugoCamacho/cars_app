class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = find_car
  end

  def edit
    @car = find_car
  end

  def update
    @car = find_car
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
    @car = find_car
    @car.destroy
    redirect_to cars_path, alert: "¡Vehículo eliminado satisfactoriamente!"
  end

private

  def car_params
    params.require(:car).
        permit(:plate_number, :model, :year)
  end

  def find_car
    Car.find(params[:id])
  end
end
