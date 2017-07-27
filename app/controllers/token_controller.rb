class TokenController < ApplicationController
  def create
    code = params[:code]
    user = StravaService.authenticate(code)
    session[:user_id] = user.id
    redirect_to dashboard_path
  end
end
