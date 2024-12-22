class Api::V1::MaintenanceServicesController < ApplicationController
  before_action :set_maintenance_service, only: [ :show, :update, :destroy ]
  skip_before_action :verify_authenticity_token

  # GET /api/v1/maintenance_services
  def index
    @maintenance_services = MaintenanceService.all
    render json: @maintenance_services
  end

  # GET /api/v1/maintenance_services/1
  def show
    render json: @maintenance_service
  end

  # POST /api/v1/maintenance_services
  def create
    @maintenance_service = MaintenanceService.new(maintenance_service_params)
    if @maintenance_service.save
      render json: @maintenance_service, status: :created
    else
      render json: @maintenance_service.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/maintenance_services/1
  def update
    if @maintenance_service.update(maintenance_service_params)
      render json: @maintenance_service
    else
      render json: @maintenance_service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/maintenance_services/1
  def destroy
    @maintenance_service.destroy
  end

  private

  def set_maintenance_service
    @maintenance_service = MaintenanceService.find(params[:id])
  end

  def maintenance_service_params
    params.require(:maintenance_service).permit(:description, :status, :date, :car_id)
  end
end
