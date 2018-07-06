class Search::CompaniesController < ApplicationController
  def index
    host = "https://api.companieshouse.gov.uk"
    api_key = ENV['companies_house_key']
    conn = Faraday.new(host) do |request|
      request.basic_auth(api_key, '')
      request.adapter Faraday.default_adapter
    end
    response = conn.get('/search/companies', {q: 'bankbond'})
    body = JSON.parse(response.body, symbolize_names: true)
    @companies = body[:items].map do |company_attrs|
      Company.new(id: company_attrs[:company_number].to_i, name: company_attrs[:title])
    end
  end
end
