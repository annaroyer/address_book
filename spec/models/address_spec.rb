require 'spec_helper'

describe Address, type: :model do
  context 'validations' do
    it { should validate_presence_of :address_line_1 }
    it { should validate_presence_of :locality }
    it do
      should validate_inclusion_of(:country)
       .in_array(['England', 'Wales', 'Scotland', 'Northern Ireland', 'Great Britain', 'United Kingdom', 'Not Specified'])
    end
  end

  context 'relationships' do
    it { should have_many :people }
    it { should have_many :companies }
  end
end
