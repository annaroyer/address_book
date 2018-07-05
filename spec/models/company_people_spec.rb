require 'rails_helper'

describe CompanyPerson, type: :model do
  context 'relationships' do
    it { should belong_to :company }
    it { should belong_to :person }
  end
end
