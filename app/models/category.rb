class Category < ApplicationRecord
    has_many :sub_categories
    has_many :company_licenses, through: :sub_categories

end
