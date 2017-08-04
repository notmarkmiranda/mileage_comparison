require 'rails_helper'

RSpec.describe Log, type: :model do
  context 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :distance }
    it { should validate_presence_of :activity_date }
    it { should validate_presence_of :travel_type }
  end

  context 'relationships' do
    it { should belong_to :user }
  end

  context 'methods' do
    before do
      user = FactoryGirl.create(:user)
      @first_log = FactoryGirl.create(:manual_log, user: user)
      FactoryGirl.create(:driving_log)
      @second_log = FactoryGirl.create(:driving_log, user: user)
    end

    it '#blank_note_field - true path' do
      expect(@second_log.blank_note_field?).to be true
    end

    it '#blank_note_field - false path' do
      expect(@first_log.blank_note_field?).to be false
    end

    it '#formatted_long_date' do
      expect(@second_log.formatted_long_date).to eq('Saturday, May 9, 2015')
    end
    it 'returns 2 for user log' do
      expect(@second_log.number_for_user).to eq(2)
    end

    it '#placeholder_date - true path' do
      expect(@second_log.placeholder_date).to eq(@second_log.activity_date)
    end

    it '#placeholder_date - false path' do
      expect(Log.new.placeholder_date).to eq(Date.today.to_s)
    end
  end
end
