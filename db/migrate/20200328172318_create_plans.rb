class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.references :vendor, null: false, foreign_key: true
      t.string :product_line
      t.string :name
      t.integer :price
      t.integer :capacity
      t.string :metric
      t.text :description
      t.string :billin_cycle
      t.string :currency
      t.text :cancellation_policy

      t.timestamps
    end
  end
end
