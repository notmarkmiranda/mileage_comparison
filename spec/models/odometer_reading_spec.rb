require 'rails_helper'

describe OdometerReading, type: :model do
  context 'validations' do
    it { should validate_presence_of :date }
    it { should validate_presence_of :mileage }
  end

  context 'relationships' do
    it { should have_many :logs }
    it { should belong_to :user }
  end
end
