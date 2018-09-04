require 'rails_helper'

describe 'Appointments API', type: :request do
  it 'edit appointments' do
    customer = create(:customer)
    appointment = create(:appointment, customer_id: customer.id)

    data = {}
    data['date'] = '2018-09-25'
    data['start_time'] = '09:00:00'
    data['end_time'] = '10:00:00'
    data['price'] = 159.52

    valid_params = {}
    valid_params = { date: '2018-09-25', start_time: '09:00:00',
                     end_time: '10:00:00', price: 159.52 }

    put api_appointment_path(id: appointment.id ,params: valid_params)
    data = JSON.parse(response.body)
    expect(data['message']).to eq 'Compromisso editado com sucesso.'
  end

  it 'edit appointments with blank params' do
    customer = create(:customer)
    appointment = create(:appointment, customer_id: customer.id)

    data = {}
    data['date'] = ''
    data['start_time'] = ''
    data['end_time'] = ''
    data['price'] = 199.52

    valid_params = {}
    valid_params = { date: '', start_time: '',
                     end_time: '', price: 199.52 }

    put api_appointment_path(id: appointment.id ,params: valid_params)
    data = JSON.parse(response.body)
    expect(data['message']).to eq 'Compromisso não pode ser editado.'
  end
end
