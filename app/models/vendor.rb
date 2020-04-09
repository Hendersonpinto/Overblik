class Vendor < ApplicationRecord
    validates :name, uniqueness: { case_sensitive: false }, presence:true
    has_many :vendor_contacts
    has_many :plans
    has_many :company_licenses, through: :plans

end
