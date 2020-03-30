class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.references :company, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.string :role
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
