class CompaniesHouseService
  def initialize(path="")
    @host = "https://api.companieshouse.gov.uk"
    @api_key = ENV['companies_house_key']
    @path = path
  end

  def get_data(endpoint, params={})
    response = conn.get("#{path}/#{endpoint}", params)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :host, :api_key, :path

    def conn
      Faraday.new(host) do |request|
        request.basic_auth(api_key, '')
        request.adapter Faraday.default_adapter
      end
    end
end
