class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      @user.update_token
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    cookies[:user_cookie] = nil
    redirect_to root_path
  end
end
