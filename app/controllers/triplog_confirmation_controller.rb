class TriplogConfirmationController < ApplicationController
  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    @user.update(verified_params)
    # TriplogImportJob.perform_later(@user) if verified_params[:triplog_email].present?
    redirect_to dashboard_path
  end

  private

  def verified_params
    if triplog_confirmation_params[:triplog_email].blank?
      triplog_confirmation_params
    else
      triplog_confirmation_params.merge(triplog_confirmed: true)
    end
  end

  def triplog_confirmation_params
    params.require(:user).permit(:triplog_email)
  end

end
