require 'rails_helper'

RSpec.describe 'dashboard request', type: :request do
  context do
    before do
      user = FactoryGirl.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'GET#dashboard' do
      get '/dashboard'
      expect(response.status).to eq(200)
    end
  end
end

