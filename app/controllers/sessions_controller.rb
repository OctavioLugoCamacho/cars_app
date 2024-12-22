class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (session[:intended_url] || user),
        notice: "Bienvenido, #{user.name}"
        session[:intended_url] = nil
    else
      flash.now[:alert] = "Correo/Contraseña inválidos"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to cars_path, notice: "Cerró sesión correctamente"
  end
end
