class CompaniesHouseService

  def self.get_url(endpoint, params)
    response = conn.get(endpoint, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def self.conn
      Faraday.new("https://api.companieshouse.gov.uk") do |request|
        request.basic_auth(ENV['companies_house_key'], '')
        request.adapter Faraday.default_adapter
      end
    end
end
