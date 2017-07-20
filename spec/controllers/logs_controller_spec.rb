require 'rails_helper'

RSpec.describe LogsController, type: :controller do
  context 'logged in user can do the things' do
    before do
      user = FactoryGirl.create(:user)
      @log = FactoryGirl.create(:driving_log, user: user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'GET#index' do
      get :index
      expect(response).to render_template :index
    end

    it 'GET#show' do
      get :show, params: { id: @log.id }
      expect(response).to render_template :show
    end

    it 'GET#show - wrong user' do
      new_log = FactoryGirl.create(:manual_log)
      get :show, params: { id: new_log.id }
      expect(response).to redirect_to root_path
    end

    it 'GET#new' do
      get :new
      expect(response).to render_template :new
    end

    it 'POST#create - happy' do
      attrs = FactoryGirl.attributes_for(:driving_log)
      post :create, params: { log: attrs }
      expect(response).to redirect_to log_path(Log.last)
    end

    it 'POST#create - sad' do
      attrs = FactoryGirl.attributes_for(:driving_log)
      attrs.delete(:distance)
      post :create, params: { log: attrs }
      expect(response).to render_template :new
    end

    it 'GET#edit' do
      get :edit, params: { id: @log.id }
      expect(response).to render_template :edit
    end

    it 'GET#edit' do
      new_log = FactoryGirl.create(:manual_log)
      get :edit, params: { id: new_log.id }
      expect(response).to redirect_to root_path
    end

    it 'PATCH#update - happy' do
      patch :update, params: { id: @log.id, log: { distance: 12 } }
      expect(response).to redirect_to @log
    end

    it 'PATCH#update - sad' do
      patch :update, params: { id: @log.id, log: { distance: '' } }
      expect(response).to render_template :edit
    end

    it 'DELETE#destroy' do
      delete :destroy, params: { id: @log.id }
      expect(response).to redirect_to logs_path
    end
  end

  context 'non-logged in user' do
    before { @log = FactoryGirl.create(:driving_log) }

    it 'GET#index' do
      get :index
      expect(response).to redirect_to root_path
    end

    it 'GET#show' do
      get :show, params: { id: @log.id }
      expect(response).to redirect_to root_path
    end

    it 'GET#edit' do
      get :edit, params: { id: @log.id }
      expect(response).to redirect_to root_path
    end
  end
end
