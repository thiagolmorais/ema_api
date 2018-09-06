require 'rails_helper'

describe 'Appointments API', type: :request do
  it 'see a specific appointments registered' do
    customer = create(:customer)
    appointment = create(:appointment, customer_id: customer.id)

    get api_appointment_path(id: appointment.id)
    data = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(data['date']).to eq I18n.localize appointment.date
    # expect(data['start_time']).to eq appointment.start_time
    # expect(data['end_time']).to eq appointment.end_time
    expect(data['status']).to eq appointment.status
    expect(data['price']).to eq appointment.price
    expect(data['customer_id']).to eq appointment.customer_id
  end

  it 'and see a message if appointment found' do
      get api_appointment_path(id: 1)

      data = JSON.parse(response.body)
      expect(data['message']).to eq 'Compromisso não encontrado'
      expect(response.status).to eq 404
    end
end
