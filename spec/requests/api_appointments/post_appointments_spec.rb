require 'rails_helper'

describe 'Appointments API', type: :request do
  it 'create appointments' do
    customer = create(:customer)

    data = {}
    data['date'] = '2018-08-27'
    data['start_time'] = '08:00:00'
    data['end_time'] = '09:00:00'
    data['price'] = 199.52

    valid_params = {}
    valid_params = { date: '2018-08-27', start_time: '08:00:00',
                     end_time: '09:00:00', price: 199.52 }

    post api_customer_prices_path(customer_id: customer.id ,params: valid_params)
    data = JSON.parse(response.body)
    expect(response.status).to eq 201
    expect(data['message']).to eq 'Preço cadastrado com sucesso.'
  end
end
