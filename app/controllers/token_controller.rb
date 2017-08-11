class TokenController < ApplicationController
  def create
    code = params[:code]
    user = StravaService.authenticate(code)
    StravaImportJob.perform_later(user, user.access_token)
    session[:user_id] = user.id
    redirect_to dashboard_path
  end
end
