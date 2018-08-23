require 'rails_helper'
require 'net/http'
describe 'Customers API', type: :request do
  it 'create customer' do
    data = {}
    data['name'] = 'Custumer A'
    data['email'] = 'customer.a@email.com'
    data['phone'] = '123456789'

    valid_params = {}
    valid_params = { name: 'Customer A', email:'customer.a@email.com',
                     phone: '123456789' }

    post api_customers_path(params: valid_params)
    data = JSON.parse(response.body)
    expect(response.status).to eq 201
    expect(data['message']).to eq 'Cliente cadastrado com sucesso.'
  end
end
