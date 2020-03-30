class CreateSystemAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :system_accounts do |t|
      t.string :stripe_account
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
