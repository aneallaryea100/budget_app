require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    Group.new(name: 'Lion Judah', icon: 'lion', user_id: 1)
  end 

  before { subject.save }

  context 'Test group validations' do
    it 'is a group with valid attributes' do
      expect(subject.name).to be_present
    end

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'email should be an string' do
      expect(subject.icon).to be_a_kind_of(String)
    end
  end

end
