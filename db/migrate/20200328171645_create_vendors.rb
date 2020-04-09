class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :website
      t.string :address
      t.string :city
      t.string :postal_zip
      t.string :country
      t.string :category

      t.timestamps
    end
  end
end
