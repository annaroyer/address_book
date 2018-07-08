class Company < ApplicationRecord
  validates_presence_of :name
  has_many :company_people
  has_many :people, through: :company_people
  # has_many :company_addresses
  # has_many :addresses, through: :company_addresses
  belongs_to :address
  accepts_nested_attributes_for :address
end
