require 'rails_helper'

describe CompaniesHouseService do
  context 'class methods' do
    describe '.get_url' do
      it 'returns the data from a request to the search/companies endpoint' do
        VCR.use_cassette('companies_search') do
          endpoint = '/search/companies'
          params = { q: 'bankbond' }
          companies = CompaniesHouseService.get_url(endpoint, params)

          expect(companies[:items].count).to eq(3)
          expect(companies[:items].first[:title]).to eq('BANKBOND LIMITED')
        end
      end
    end
  end
end
