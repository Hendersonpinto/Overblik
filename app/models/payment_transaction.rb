class PaymentTransaction < ApplicationRecord
  belongs_to :system_account
end
