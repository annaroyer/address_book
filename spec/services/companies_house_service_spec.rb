require 'rails_helper'

describe CompaniesHouseService do
  context 'class methods' do
    describe '.get_url' do
      it 'returns the data from a request to the search/companies endpoint' do
        VCR.use_cassette('companies_search') do
          params = { q: 'bankbond' }
          companies = CompaniesHouseService.search_companies(params)

          expect(companies.count).to eq(3)
          expect(companies.first.name).to eq('BANKBOND LIMITED')
        end
      end
    end
  end
end
