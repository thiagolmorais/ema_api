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

    post api_appointments_path(customer_id: customer.id ,params: valid_params)
    data = JSON.parse(response.body)
    expect(response.status).to eq 201
    expect(data['message']).to eq 'Compromisso cadastrado com sucesso.'
  end

  it 'create appointments with blank params' do
    customer = create(:customer)

    data = {}
    data['date'] = ''
    data['start_time'] = ''
    data['end_time'] = ''
    data['price'] = 199.52

    valid_params = {}
    valid_params = { date: '', start_time: '',
                     end_time: '', price: 199.52 }

    post api_appointments_path(customer_id: customer.id ,params: valid_params)
    data = JSON.parse(response.body)
    expect(data['message']).to eq 'Compromisso não pode ser cadastrado.'
  end
end
