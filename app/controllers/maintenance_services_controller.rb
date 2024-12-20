class MaintenanceServicesController < ApplicationController
  def index
    @maintenance_services = MaintenanceService.all
  end

  def new
    @car = Car.find(params[:car_id])
    @maintenance_service = @car.maintenance_services.new
  end

  def create
    @car = Car.find(params[:car_id])
    @maintenance_service = @car.maintenance_services.new(maintenance_service_params)
    if @maintenance_service.save
      redirect_to @car, notice: "Se ha registrado un nuevo servicio"
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def maintenance_service_params
    params.require(:maintenance_service).permit(:description, :status, :date)
  end
end
