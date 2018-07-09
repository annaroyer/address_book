require 'spec_helper'

describe Person, type: :model do
  context 'validations' do
    it { should validate_presence_of :last_name }
  end

  context 'relationships' do
    it { should have_many :companies }
    it { should belong_to :address }
  end
end
