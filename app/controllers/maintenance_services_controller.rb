class MaintenanceServicesController < ApplicationController
  before_action :find_car, only: [ :new, :create ]

  def index
    @maintenance_services = MaintenanceService.all
  end

  def new
    @maintenance_service = @car.maintenance_services.new
  end

  def create
    @maintenance_service = @car.maintenance_services.new(maintenance_service_params)
    if @maintenance_service.save
      redirect_to @car, notice: "Se ha registrado un nuevo servicio"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @maintenance_service = MaintenanceService.find(params[:car_id])
    @maintenance_service.destroy
    redirect_to @car, alert: "Servicio eliminado satisfactoriamente!"
  end

private

  def maintenance_service_params
    params.require(:maintenance_service).permit(:description, :status, :date)
  end

  def find_car
    @car = Car.find(params[:car_id])
  end
end
