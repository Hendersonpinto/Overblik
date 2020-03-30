class CreateCompanyLicenseAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :company_license_accounts do |t|
      t.references :company_license, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.boolean :active
      t.string :access_permission

      t.timestamps
    end
  end
end
