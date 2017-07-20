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
end
