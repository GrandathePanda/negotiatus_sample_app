require 'securerandom'
FactoryBot.define do
    factory :shipment do
        order_number { Faker::Number.unique.number(20) }
        address {"#{Faker::Address.street_address} #{Faker::Address.secondary_address}, #{Faker::Address.city} #{Faker::Address.state} #{Faker::Address.zip_code}" }
        tracking_identifier { SecureRandom.uuid }
        delivered { [true, false].sample }
        ordered_at { Faker::Date.between(1.month.ago, Date.today) }
        vendor
        after(:build) do |shipment|
            if shipment.delivered
                shipment.delivery_time = Faker::Date.between(Date.today, 1.month.from_now)
            end
        end
    end
end
