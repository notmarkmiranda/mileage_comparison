require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest }
  end

  context 'relationships' do
    it { should have_many :logs }
  end

  context 'methods' do
    before do
      @user = FactoryGirl.create(:user)
      FactoryGirl.create(:driving_log, distance: 10, user: @user)
      FactoryGirl.create(:manual_log, distance: 100, user: @user)
    end

    it '#miles variance' do
      expect(@user.miles_variance).to eq(90)
    end

    it '#total_specific_miles' do
      expect(@user.total_specific_miles(0)).to eq(10)
      expect(@user.total_specific_miles(1)).to eq(100)
    end

    it '#total_miles' do
      expect(@user.total_miles).to eq(110)
    end
  end
end
