require 'rails_helper'
require 'net/http'
describe 'Price API', type: :request do
  it 'create price' do
    customer = create(:customer)
    valid_params = {}
    valid_params = { price: '150.99', readjust:'2018-07-31' }

    post api_customer_prices_path(customer_id: customer.id, params: valid_params)

    data = JSON.parse(response.body)
    expect(response.status).to eq 201
    expect(data['message']).to eq 'Preço cadastrado com sucesso.'
  end
end
