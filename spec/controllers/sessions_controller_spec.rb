require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context do
    before do
      @user = FactoryGirl.create(:user)
    end

    it 'GET#new' do
      get :new
      expect(response).to render_template :new
    end

    it 'POST#create - happy' do
      post :create, params: { session: { login: @user.login, password: 'password' } }
      expect(response).to redirect_to dashboard_path
    end

    it 'POST#create - sad login' do
      post :create, params: { session: { login: 'wrong', password: 'password' } }
      expect(response).to render_template :new
    end

    it 'POST#create - sad password' do
      post :create, params: { session: { login: @user.login, password: 'passwordz' } }
      expect(response).to render_template :new
    end

    it 'GET#destroy' do
      get :destroy
      expect(response).to redirect_to root_path
    end
  end
end
