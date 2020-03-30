class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :department
  has_many :company_license_accounts
  has_many :company_licenses, through: :company_license_accounts
  validates :email, uniqueness:true, presence:true
end
