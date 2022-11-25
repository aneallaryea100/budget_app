require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    described_class.new(name: 'Test Entity', amount: 100, user_id: 1, group_id: 1)
  end

  before { subject.save }

  context 'Test entity validations' do
    it 'is a entity with valid attributes' do
      expect(subject.name).to be_present
    end

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should be an string' do
      expect(subject.name).to be_a_kind_of(String)
    end

    it 'amount should be present' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'amount should be an integer' do
      expect(subject.amount).to be_a_kind_of(Numeric)
    end

    it 'amount should be greater than or equal to 0' do
      expect(subject.amount).to be >= 0
    end
  end
end
