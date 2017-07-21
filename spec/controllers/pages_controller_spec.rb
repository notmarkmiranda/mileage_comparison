require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  context do
    it 'GET#index' do
      get :index
      expect(response).to render_template :index
    end
  end
end
