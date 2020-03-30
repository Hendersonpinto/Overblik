class CompanyLicenseOwner < ApplicationRecord
  belongs_to :company_license
  belongs_to :user
end
