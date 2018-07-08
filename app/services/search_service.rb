class SearchService
  def initialize
    @companies_house = CompaniesHouseService.new('/search')
  end

  def get_companies(params)
    companies_house.get_data("companies", params)[:items].map do |raw_company|
      Company.new(
        name: raw_company[:title],
        number: raw_company[:company_number]
      )
    end
  end

  private
    attr_reader :companies_house
end
