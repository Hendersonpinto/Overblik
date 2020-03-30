class CreatePaymentTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_transactions do |t|
      t.references :system_account, null: false, foreign_key: true
      t.datetime :date
      t.string :stripe_url

      t.timestamps
    end
  end
end
