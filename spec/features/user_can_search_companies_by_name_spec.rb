require 'rails_helper'

describe 'As a user' do
  context 'when I visit /' do
    scenario 'I can search companies by name' do
      bankbond_companies = File.open('./spec/fixtures/bankbond_companies.json')
      stub_request(:get, 'https://api.companieshouse.gov.uk/search/companies?q=bankbond')
        .to_return(status: 200, body: bankbond_companies, headers: {})

      visit '/'

      fill_in :q, with: 'bankbond'
      click_on 'Search'

      expect(current_path).to eq('/search/companies')
      expect(page).to have_field(:q)
      expect(page).to have_link 'BANKBOND LIMITED'
      expect(page).to have_link 'JANI-JACK LIMITED'
      expect(page).to have_link 'SWARLAND GOLF CLUB LIMITED'
    end
  end
end
