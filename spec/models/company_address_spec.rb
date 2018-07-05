require 'rails_helper'

describe CompanyAddress, type: :model do
  context 'relationships' do
    it { should belong_to :company }
    it { should belong_to :address }
  end
end
