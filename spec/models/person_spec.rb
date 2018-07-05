require 'rails_helper'

describe Person, type: :model do
  context 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end

  context 'relationships' do
    it { should have_many :companies }
  end
end
# Create an address book that can record two types of entities -
# The address book can record addresses for people and organizations
