FactoryBot.define do
  factory :appointment do
    start_time '2018-04-22T05:00:00.000Z'
    end_time '2018-04-22T06:00:00.000Z'
    status false
    price 199.52
    customer 1
  end
end
