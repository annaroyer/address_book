class CompaniesHouseService

  def self.search_companies(params)
    get_url('/search/companies', params)[:items].map do |attrs|
      Company.new(id: attrs[:company_number].to_i, name: attrs[:title])
    end
  end

  private

    def self.get_url(endpoint, params={})
      response = conn.get(endpoint, params)
      JSON.parse(response.body, symbolize_names: true)
    end

    def self.conn
      Faraday.new("https://api.companieshouse.gov.uk") do |request|
        request.basic_auth(ENV['companies_house_key'], '')
        request.adapter Faraday.default_adapter
      end
    end
end
