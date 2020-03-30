class CreateVendorContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :vendor_contacts do |t|
      t.references :vendor, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.string :role
      t.text :notes

      t.timestamps
    end
  end
end
