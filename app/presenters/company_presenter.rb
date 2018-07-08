class CompanyPresenter
  attr_reader :name, :number, :address

  def initialize(attrs)
    @name = attrs[:company_name] || attrs[:title]
    @number = attrs[:company_number]
    @address = Address.new(attrs[:registered_office_address] || attrs[:address])
  end

  def officers
    CompaniesHouseService.new.get_data("company/#{number}/officers")[:items].map do |raw_officer|
      PersonPresenter.new(raw_officer)
    end
  end
end
