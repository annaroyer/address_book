class Person < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_many :company_people
  has_many :companies, through: :company_people
  belongs_to :address
end
