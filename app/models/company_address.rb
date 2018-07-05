class CompanyAddress < ApplicationRecord
  belongs_to :company
  belongs_to :address
end
