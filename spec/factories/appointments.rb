FactoryBot.define do
  factory :appointment do
    date '2018-09-05'
    start_time '10:000'
    end_time '11:00'
    status false
    price 199.52
    customer 1
  end
end
