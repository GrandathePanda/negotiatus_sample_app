class CreateVendorTable < ActiveRecord::Migration[5.2]
  def change
      create_table :vendors do |t|
          t.string :name, null: false
          t.integer :average_delivery_time, null: false, default: 0.0
          t.index :name, unique: true
      end
  end
end
