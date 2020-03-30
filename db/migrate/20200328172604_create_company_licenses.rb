class CreateCompanyLicenses < ActiveRecord::Migration[6.0]
  def change
    create_table :company_licenses do |t|
      t.references :plan, null: false, foreign_key: true
      t.references :sub_category, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :logo

      t.timestamps
    end
  end
end
