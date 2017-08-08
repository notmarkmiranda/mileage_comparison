require 'rails_helper'

RSpec.describe TokenController, type: :controller do
  let(:service) { spy('strava_service') }

  context 'something' do
    before do
      @user = FactoryGirl.create(:user)
      allow(StravaService).to receive(:authenticate).and_return(@user)
    end

    it 'GET#create' do
      @user.update(triplog_confirmed: true)
      get :create, params: { code: 'asdfjkl1234' }
      expect(response).to redirect_to dashboard_path
    end
  end
end
