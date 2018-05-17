FactoryBot.define do
    factory :vendor do
        name { Faker::Company.unique.name }
        average_delivery_time { Faker::Number.between(1, 31) }
    end
end
