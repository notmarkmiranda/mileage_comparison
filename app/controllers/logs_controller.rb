class LogsController < ApplicationController
  before_action :require_user
  before_action :load_log, except: [:index, :new, :create]
  before_action :check_ownership, except: [:index, :new, :create]

  def index
    @logs = current_user.logs
  end

  def show
  end

  def new
    @log = current_user.logs.new
    @travel_types = Log.travel_types.keys
  end

  def create
    @log = current_user.logs.new(log_params)
    if @log.save
      redirect_to @log
    else
      render :new
    end
  end

  def edit
    @travel_types = Log.travel_types.keys
  end

  def update
    if @log.update(log_params)
      redirect_to @log
    else
      render :edit
    end
  end

  def destroy
    @log.delete
    redirect_to logs_path
  end

  private
  def check_ownership
    redirect_to root_path unless @log.user_id == current_user.id
  end

  def load_log
    @log = Log.find(params[:id])
  end

  def log_params
    params.require(:log).permit(:user_id, :distance, :date, :travel_type, :notes)
  end
end
