require 'webmock/rspec'

def stub_search
  bankbond_companies = File.open('./spec/fixtures/bankbond_companies.json')
  stub_request(:get, 'https://api.companieshouse.gov.uk/search/companies?q=bankbond')
    .to_return(status: 200, body: bankbond_companies, headers: {})
end


def stub_get_company_info
  bankbond_limited = File.open('./spec/fixtures/bankbond_limited.json')
  bankbond_limited_officers = File.open('./spec/fixtures/bankbond_limited_officers.json')
  stub_request(:get, 'https://api.companieshouse.gov.uk/company/05275061')
    .to_return(status: 200, body: bankbond_limited, headers: {})
  stub_request(:get, 'https://api.companieshouse.gov.uk/company/05275061/officers')
    .to_return(status: 200, body: bankbond_limited_officers, headers: {})
end
