require 'rails_helper'

RSpec.describe Log, type: :model do
  context 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :distance }
    it { should validate_presence_of :date }
    it { should validate_presence_of :travel_type }
  end

  context 'relationships' do
    it { should belong_to :user }
  end

  context 'methods' do
    before do
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:manual_log, user: user)
      FactoryGirl.create(:driving_log)
      @second_log = FactoryGirl.create(:driving_log, user: user)
    end

    it 'returns 2 for user log' do
      expect(@second_log.number_for_user).to eq(2)
    end
  end
end
