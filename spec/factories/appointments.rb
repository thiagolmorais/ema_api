FactoryBot.define do
  factory :appointment do
    date "2018-08-27"
    start_time "2018-08-27 20:14:42"
    end_time "2018-08-27 20:14:42"
    status false
    price 199.52
    custumer_id 1
    customer nil
  end
end
