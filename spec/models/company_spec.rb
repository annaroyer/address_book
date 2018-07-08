require 'rails_helper'

describe Company, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
  end

  context 'relationships' do
    it { should have_many :people }
    it { should belong_to :address }
  end
end
