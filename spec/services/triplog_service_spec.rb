require 'rails_helper'

describe TriplogService, type: :service do
  before do
    @user = FactoryGirl.create(:user, triplog_email: 'markmiranda51@gmail.com')
  end

  it do
    require 'pry'; binding.pry
    TriplogService.new(@user)
  end
end
