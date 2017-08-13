require 'rails_helper'

describe OdometerReadingsController, type: :controller do
  context 'get' do
    before do
      @odometer_reading = FactoryGirl.create(:odometer_reading)
      user = @odometer_reading.user
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'GET#show' do
      get :show, params: { id: @odometer_reading.id }
      expect(response).to render_template :show
    end

    it 'GET#new' do
      get :new
      expect(response).to render_template :new
    end

    it 'GET#edit' do
      get :edit, params: { id: @odometer_reading.id }
      expect(response).to render_template :edit
    end
  end

  context 'post' do
    before do
      user = FactoryGirl.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'POST#create - happy path' do
      attrs = FactoryGirl.attributes_for(:odometer_reading)
      expect {
        post :create, params: { odometer_reading: attrs }
      }.to change(OdometerReading, :count)
      expect(response).to redirect_to odometer_reading_path(OdometerReading.last)
    end

    it 'POST#create - sad path' do
      expect {
        post :create, params: { odometer_reading: { date: '' } }
      }.to_not change(OdometerReading, :count)
      expect(response).to render_template :new
    end
  end

  context 'patch' do
    before do
      @or = FactoryGirl.create(:odometer_reading)
    end

    it 'PATCH#update - happy path' do
      expect {
        patch :update, params: { id: @or.id, odometer_reading: { mileage: 99999 } }
        @or.reload
      }.to change(@or, :mileage).to(99999)
      expect(response).to redirect_to odometer_reading_path(@or)
    end

    it 'PATCH#update - sad path' do
      expect {
        patch :update, params: { id: @or.id, odometer_reading: { mileage: '' } }
      }.to_not change(@or, :mileage)
      expect(response).to render_template :edit
    end
  end
end
