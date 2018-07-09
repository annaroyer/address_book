class Person < ApplicationRecord
  validates_presence_of :last_name
  has_many :company_people
  has_many :companies, through: :company_people
  belongs_to :address
  accepts_nested_attributes_for :address
end
