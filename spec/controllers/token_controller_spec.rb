require 'rails_helper'

RSpec.describe TokenController, type: :controller do
  let(:service) { spy('strava_service') }

  context 'something' do
    before do
      allow(StravaService).to receive(:authenticate).and_return(user)
    end

    it 'GET#create' do
      get :create, params: { code: 'asdfjkl1234' }
    end
  end
end
