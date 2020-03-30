class CreateLicenseTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :license_transactions do |t|
      t.integer :total_purchase
      t.datetime :purchase_date
      t.references :company_license, null: false, foreign_key: true
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
