FactoryBot.define do
  factory :appointment do
    date '2018-08-27'
    start_time '20:00:00'
    end_time '21:00:00'
    status false
    price 199.52
    custumer_id 1
  end
end
