require 'rails_helper'

describe 'As a user' do
  context 'After I have searched for companies by name' do
    before(:each) do
      bankbond_companies = File.open('./spec/fixtures/bankbond_companies.json')
      stub_request(:get, 'https://api.companieshouse.gov.uk/search/companies?q=bankbond')
        .to_return(status: 200, body: bankbond_companies, headers: {})

      visit '/'

      fill_in :q, with: 'bankbond'
      click_on 'Search'
    end

    scenario 'I can click on a company name link and see information about the company' do
      click_on 'BANKBOND LIMITED'

      expect(current_path).to eq('/companies/5275061')
    end
  end
end
