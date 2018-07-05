class Company < ApplicationRecord
  validates_presence_of :name
  has_many :company_people
  has_many :people, through: :company_people
end
