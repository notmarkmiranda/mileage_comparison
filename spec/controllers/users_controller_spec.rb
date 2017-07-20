require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'happy paths' do
    before { @user = FactoryGirl.create(:user) }

    it 'GET#show' do
      get :show, params: { id: @user.id }
      expect(response).to render_template :show
    end

    it 'GET#new' do
      get :new
      expect(response).to render_template :new
    end

    it 'POST#create' do
      attrs = FactoryGirl.attributes_for(:user)
      post :create, params: { user: attrs }
      expect(response).to redirect_to user_path(User.last)
    end

    it 'GET#edit' do
      get :edit, params: { id: @user.id }
      expect(response).to render_template :edit
    end

    it 'PATCH#update' do
      patch :update, params: { id: @user.id, user: { email: "a@b.com", login: "1234", password: "asdf" } }
      expect(response).to redirect_to @user
    end
  end
end
