class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    # add_reference :users, :company, foreign_key: true
    # add_reference :users, :department, foreign_key: true
    # add_reference :users, :system_account, foreign_key: true
    add_reference :users, :company, null: false, foreign_key: true
    add_reference :users, :department, null: false, foreign_key: true
    add_reference :users, :system_account, null: false, foreign_key: true
    add_column :users, :role, :string
  end
end
