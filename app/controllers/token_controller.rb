class TokenController < ApplicationController
  def create
    code = params[:code]
    user = StravaService.authenticate(code)
    StravaImportJob.perform_later(user, user.access_token)
    session[:user_id] = user.id
    if user.triplog_confirmed
      # TriplogImportJob.perform_later(user)
      redirect_to dashboard_path
    else
      redirect_to triplog_confirmation_path
    end
  end
end
