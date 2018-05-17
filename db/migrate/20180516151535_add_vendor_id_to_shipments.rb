class AddVendorIdToShipments < ActiveRecord::Migration[5.2]
  def change
      remove_column :shipments, :vendor, :string
      add_reference :shipments, :vendor, foreign_key: true
  end
end
