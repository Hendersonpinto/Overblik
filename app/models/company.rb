class Company < ApplicationRecord
    has_many :users
    accepts_nested_attributes_for :users
    has_many :company_licenses
    has_many :employees
    has_many :departments, through: :employees
    has_many :system_accounts, through: :users
    validates :name, uniqueness: { case_sensitive: false }, presence:true
end
