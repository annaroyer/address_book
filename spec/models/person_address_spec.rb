require 'rails_helper'

describe PersonAddress, type: :model do
  context 'relationships' do
    it { should belong_to :person }
    it { should belong_to :address }
  end
end
