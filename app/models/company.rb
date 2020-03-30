class Company < ApplicationRecord
    has_many :users
    has_many :company_licenses
    has_many :employees
    has_many :departments, through: :employees
    has_many :system_accounts, through: :users
    validates :name, uniqueness:true, presence:true
end
