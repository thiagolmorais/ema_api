require 'rails_helper'
describe 'Customers API', type: :request do
  it 'see all customers registered' do
    customer = create(:customer)

    get api_customers_path
    data = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(data[0]['name']).to eq customer.name
    expect(data[0]['email']).to eq customer.email
    expect(data[0]['phone']).to eq customer.phone
    expect(data[0]['status']).to eq customer.status
  end

  it 'and see a message if no customers found' do
    get api_customers_path

    data = JSON.parse(response.body)

    expect(data).to eq []
  end
end
