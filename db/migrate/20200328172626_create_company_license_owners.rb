class CreateCompanyLicenseOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :company_license_owners do |t|
      t.references :company_license, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
