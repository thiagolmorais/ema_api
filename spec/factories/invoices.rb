FactoryBot.define do
  factory :invoice do
    value 1.5
    competence "MyString"
    due_date "2018-12-02"
    payment "2018-12-02"
    status false
    appointment_id 1
  end
end
