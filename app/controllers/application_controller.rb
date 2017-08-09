class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :cookie_set

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to root_path unless current_user
  end

  def cookie_set
    return unless current_user
    cookies[:user_cookie] = current_user.dashboard_token
  end
end
