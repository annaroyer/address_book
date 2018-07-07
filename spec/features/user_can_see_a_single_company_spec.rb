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
      bankbond_limited = File.open('./spec/fixtures/bankbond_limited.json')
      bankbond_limited_officers = File.open('./spec/fixtures/bankbond_limited_officers.json')
      stub_request(:get, 'https://api.companieshouse.gov.uk/company/05275061')
        .to_return(status: 200, body: bankbond_limited, headers: {})
      stub_request(:get, 'https://api.companieshouse.gov.uk/company/05275061/officers')
        .to_return(status: 200, body: bankbond_limited_officers, headers: {})

      click_on 'BANKBOND LIMITED'

      expect(current_path).to eq('/companies/05275061')
      expect(page).to have_content('BANKBOND LIMITED')
      expect(page).to have_content('05275061')
      expect(page).to have_content("Unit 2 Howard Avenue\nBarnstaple, Devon\nEX32 8QA")
    end
  end
end
