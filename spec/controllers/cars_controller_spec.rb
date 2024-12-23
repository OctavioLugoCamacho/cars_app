require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  let(:car) { create(:car) }

  describe 'GET #index' do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:params) do
      {
        id: car.id
      }
    end
    it "render the show template" do
      get :show, params: params
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it "render the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:params) do
      {
        car: {
          plate_number: Faker::Vehicle.license_plate,
          model: Faker::Vehicle.model,
          year: Faker::Vehicle.year,
          created_at: "2023-05-14 12:27:14 UTC",
          updated_at: "2023-05-14 14:07:14 UTC"
        }
      }
    end
    it "create the new car and render the show view" do
      post :create, params: params
      car = Car.last
      expect(car.plate_number).to eq(params[:car][:plate_number])
      expect(car.model).to eq(params[:car][:model])
      expect(response).to redirect_to("/cars/#{car.id}")
    end
  end

  describe 'GET #edit' do
    let(:params) do
      {
        id: car.id
      }
    end
    it "render the car form" do
      get :edit, params: params
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    let(:params) do
    {
      id: car.id,
      car: {
        plate_number: Faker::Vehicle.license_plate,
        model: Faker::Vehicle.model,
        year: Faker::Vehicle.year,
        created_at: "2023-05-14 12:27:14 UTC",
        updated_at: "2023-05-14 14:07:14 UTC"
      }
    }
    end
    it "update the car and render the template show car" do
      put :update, params: params
      expect(car.reload.plate_number).to eq(params[:car][:plate_number])
      expect(car.reload.model).to eq(params[:car][:model])
      expect(response).to redirect_to("/cars/#{car.id}")
    end
  end

  describe 'DELETE #destroy' do
    let(:params) do
      {
        id: car.id
      }
    end
    it "render template index" do
      delete :destroy, params: params
      expect(response).to redirect_to(cars_path)
    end
  end
end
