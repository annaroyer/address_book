class Address < ApplicationRecord
  validates_presence_of :address_line_1, :locality
  validates_inclusion_of :country,
    in: ['England', 'Wales', 'Scotland', 'Northern Ireland', 'Great Britain', 'United Kingdom', 'Not Specified'],
    on: :create
  has_many :person_addresses
  has_many :people, through: :person_addresses
  has_many :company_addresses
  has_many :companies, through: :company_addresses
end
