require 'rails_helper'

describe 'Appointments API', type: :request do
  it 'create appointments' do
    setting = create(:setting)
    customer = create(:customer)
    price = create(:price, readjust: '2018-09-01', customer_id: customer.id)

    data = {}
    data['start_time'] = '2018-09-01T05:00:00.000Z'
    data['end_time'] = '2018-09-01T06:00:00.000Z'
    data['price'] = 199.52

    valid_params = {}
    valid_params = { start_time: '2018-09-01T05:00:00.000Z',
                     price: 199.52 }

    post api_appointments_path(customer_id: customer.id ,params: valid_params)
    data = JSON.parse(response.body)
    expect(response.status).to eq 201
    expect(data['message']).to eq 'Compromisso cadastrado com sucesso.'
  end

  it 'create appointments with blank params' do
    setting = create(:setting)
    customer = create(:customer)
    price = create(:price, readjust: '2018-09-01', customer_id: customer.id)

    data = {}
    data['start_time'] = ''
    data['end_time'] = ''
    data['price'] = 199.52

    valid_params = {}
    valid_params = { date: '', start_time: '',
                     end_time: '', price: 199.52 }

    post api_appointments_path(customer_id: customer.id ,params: valid_params)
    data = JSON.parse(response.body)
    expect(data['message']).to eq ["Hora inicial não pode ficar em branco", "Hora final não pode ficar em branco"]
  end
end
