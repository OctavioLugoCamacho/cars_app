class UsersController < ApplicationController
  before_action :require_signin, except: [ :new, :create ]
  before_action :require_correct_user, only: [ :edit, :update, :destroy ]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "¡Gracias por iniciar sesión!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "¡Cuenta actualizada!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to cars_path, alert: "Se eliminó la cuenta correctamente"
  end

private

  def require_correct_user
    @user = User.find(params[:id])
    redirect_to cars_path unless current_user?(@user)
  end

  def user_params
    params.require(:user).
      permit(:name, :email, :password, :password_confirmation)
  end
end
