require 'rails_helper'

describe TriplogConfirmationController, type: :controller do
  context "routes" do
    before do
      @user = FactoryGirl.create(:user)
    end

    it 'GET edit' do
      get :edit, session: { user_id: @user.id }
      expect(response).to render_template :edit
    end

    it 'PATCH update' do
      patch :update, params: { user: { triplog_email: 'test@test.com' } }, session: { user_id: @user.id }
      expect(response).to redirect_to dashboard_path
    end
  end
end
