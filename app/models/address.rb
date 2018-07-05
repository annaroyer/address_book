class Address < ApplicationRecord
  validates_presence_of :address_line_1, :locality
  validates_inclusion_of :country,
    in: ['England', 'Wales', 'Scotland', 'Northern Ireland', 'Great Britain', 'United Kingdom', 'Not Specified'],
    on: :create
end
