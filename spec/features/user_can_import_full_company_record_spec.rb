require 'rails_helper'

describe 'As a user' do
  context 'When I am on a company show page' do
    scenario 'I can import the full record into the database' do
      stub_get_company_info
      visit 'companies/05275061'

      def import
        click_on 'Import Record to Address Book'
      end

      expect{ import }.to change(Company, :count).by(1)
      expect{ import }.to change(Person, :count).by(9)
      expect{ import }.to change(Address, :count).by(10)
    end
  end
end
