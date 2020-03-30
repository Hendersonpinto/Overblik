class Department < ApplicationRecord
    validates :name, uniqueness:true, presence:true

end
