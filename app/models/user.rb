class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company
  belongs_to :department
  belongs_to :system_account
  has_many :payment_transactions, through: :system_accounts
  has_many :company_license_owners
  has_many :company_licenses, through: :company_license_owners
  has_many :license_transactions, foreign_key: 'owner_id'
end
