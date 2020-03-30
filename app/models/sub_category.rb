class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :company_licenses

end
