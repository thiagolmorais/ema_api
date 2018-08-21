require 'rails_helper'
describe 'Customers API', type: :request do
  it 'see a specific customer registered' do
    customer_a = create(:customer, name: 'Custumer A',
                                   email: 'customer.a@email.com',
                                   phone: '123456789', status: true)
    customer_b = create(:customer, name: 'Custumer B',
                                   email: 'customer.b@email.com',
                                   phone: '987654321', status: false)

    get api_customer_path(customer_b)
    data = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(data['name']).to eq customer_b.name
    expect(data['email']).to eq customer_b.email
    expect(data['phone']).to eq customer_b.phone
    expect(data['status']).to eq customer_b.status
  end

  it 'and see a message if no customer_id found' do
      get api_customer_path(1)

      data = JSON.parse(response.body)
      expect(data['message']).to eq 'Cliente não encontrado'
      expect(response.status).to eq 404
    end
end
