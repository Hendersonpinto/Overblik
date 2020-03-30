class CompanyLicense < ApplicationRecord
  belongs_to :plan
  belongs_to :vendor
  belongs_to :sub_category
  belongs_to :company
  has_many :license_transactions
  has_many :company_license_owners
  has_many :users, through: :company_license_owners
  has_many :company_license_accounts
  has_many :employees, through: :company_license_accounts


end
