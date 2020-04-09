class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :website
      t.string :address
      t.string :city
      t.string :postal_zip
      t.string :country
      t.string :business_area

      t.timestamps
    end
  end
end
