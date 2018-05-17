require 'date'
class CreateOrderTable < ActiveRecord::Migration[5.2]
  def change
      create_table :shipments, {id: false} do |t|
          t.string :order_number, null: false
          t.string :vendor, null: false
          t.string :tracking_identifier
          t.string :address, null: false
          t.boolean :delivered, null: false, default: false
          t.date :ordered_at, null: false
          t.index :order_number, unique: true
      end
      reversible do |dir|
          dir.up {execute "ALTER TABLE shipments ADD PRIMARY KEY (order_number);"}
          dir.down {execute "ALTER TABLE shipments DROP CONSTRAINT shipments_pkey"}
      end
  end
end
