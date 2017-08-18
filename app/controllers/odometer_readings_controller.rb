class OdometerReadingsController < ApplicationController
  def show
    @or = OdometerReading.find(params[:id])
  end

  def new
    @or = OdometerReading.new
  end

  def create
    @or = current_user.odometer_readings.new(odometer_reading_params)
    other_readings = OdometerReading.other_readings?(current_user)
    if @or.save
      LogCreatorJob.perform_now(@or, @or.previous(current_user)) if other_readings
      redirect_to @or
    else
      render :new
    end
  end

  def edit
    @or = OdometerReading.find(params[:id])
  end

  def update
    @or = OdometerReading.find(params[:id])
    if @or.update(odometer_reading_params)
      redirect_to @or
    else
      render :edit
    end
  end

  private

  def odometer_reading_params
    params.require(:odometer_reading).permit(:date, :mileage, :notes)
  end
end
