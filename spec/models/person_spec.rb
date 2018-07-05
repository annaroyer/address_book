require 'rails_helper'

describe Person, type: :model do
  context 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
  end
end
# Create an address book that can record two types of entities -
# and companies (get company name, company number).
# the address book can relate people to companies.
# The address book can record addresses for people and organizations
