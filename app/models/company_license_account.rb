class CompanyLicenseAccount < ApplicationRecord
  belongs_to :company_license
  belongs_to :employee
end
