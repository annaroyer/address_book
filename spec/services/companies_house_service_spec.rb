require 'rails_helper'

describe CompaniesHouseService do
  context 'instance methods' do
    describe '#get_data' do
      subject { CompaniesHouseService.new('/search') }
      it 'returns the data from a request to the search/companies endpoint' do
        VCR.use_cassette('companies_search') do
          params = { q: 'bankbond' }
          endpoint = "companies"
          companies = subject.get_data(endpoint, params)

          expect(companies[:items].count).to eq(3)
          expect(companies[:items].first[:title]).to eq('BANKBOND LIMITED')
        end
      end
    end
  end
end
