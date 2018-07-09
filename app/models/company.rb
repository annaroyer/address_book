class Company < ApplicationRecord
  validates_presence_of :name
  has_many :company_people
  has_many :people, through: :company_people
  belongs_to :address
  accepts_nested_attributes_for :address, :people

  def self.from_service(companies_house_data)
    new(
      name: companies_house_data[:company_name],
      number: companies_house_data[:company_number],
      address_attributes: companies_house_data[:registered_office_address],
      people_attributes: CompaniesHouseService.new.get_data(companies_house_data[:links][:officers])[:items].map do |raw_officer|
                            last_name, first_name = raw_officer[:name].split(', ')
                            {first_name: first_name,
                             last_name: last_name.downcase.capitalize,
                             address_attributes: raw_officer[:address]
                            }
                          end
    )
  end
end
