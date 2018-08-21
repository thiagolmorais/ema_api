require 'rails_helper'
require 'net/http'
describe 'Customers API', type: :request do
  it 'create customer' do
    data = {}
    data['name'] = 'Custumer A'
    data['email'] = 'customer.a@email.com'
    data['phone'] = '123456789'


    uri = URI.parse('http://0.0.0.0:3000/api/customers')
    http = Net::HTTP.new(uri.host, uri.port)
    http.post(uri, data.to_query)

    # data = JSON.parse(response.body)
    # expect(response.status).to eq 201
    # expect(data['message']).to have_content('customer_params')
  end

  # it 'and see a message if no customer_id found' do
  #     get api_customer_path(1)
  #
  #     data = JSON.parse(response.body)
  #     expect(data['message']).to eq 'Cliente não encontrado'
  #     expect(response.status).to eq 404
  #   end
end
