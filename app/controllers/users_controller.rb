class UsersController < ApplicationController
  before_action :require_user, except: [:new, :create]
  before_action :load_user, except: [:new, :create]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
    end
  end

  def edit
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def load_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :login, :password)
  end
end
