require 'factory_bot'
require 'faker'
require_relative '../spec/factories/shipment_factory'
require_relative '../spec/factories/vendor_factory'

vendors = FactoryBot.create_list(:vendor, 100)
10000.times do
    FactoryBot.create(:shipment, vendor: vendors.sample)
end

