require 'rails_helper'
require 'net/http'
describe 'Customers API', type: :request do
  it 'update customer' do
    customer = create(:customer)

    data = {}
    data['name'] = 'Custumer Editado'
    data['email'] = 'customer.editado@email.com'
    data['phone'] = '777777777'

    valid_params = {}
    valid_params = { name: 'Customer Editado', email:'customer.editado@email.com',
                     phone: '777777777' }

    put api_customer_path(id: customer.id ,params: valid_params)
    data = JSON.parse(response.body)
    expect(data['message']).to eq 'Cliente editado com sucesso.'
  end

  it 'update customer parameter' do
    customer = create(:customer)

    data = {}
    data['name'] = ''
    data['email'] = ''
    data['phone'] = ''

    valid_params = {}
    valid_params = { name: 'Customer Editado', email:'', phone: '' }

    put api_customer_path(id: customer.id ,params: valid_params)
    data = JSON.parse(response.body)
    expect(data['message']).to eq 'Cliente não pode ser editado.'
  end
end
