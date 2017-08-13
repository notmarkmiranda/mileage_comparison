class OdometerReadingsController < ApplicationController
  def show
    @or = OdometerReading.find(params[:id])
  end

  def new
    @or = OdometerReading.new
  end

  def create
    @or = current_user.odometer_readings.new(odometer_reading_params)
    if @or.save
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
