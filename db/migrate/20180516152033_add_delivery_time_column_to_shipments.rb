class AddDeliveryTimeColumnToShipments < ActiveRecord::Migration[5.2]
  def change
      add_column :shipments, :delivery_time, :datetime
  end
end
