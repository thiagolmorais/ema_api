require 'rails_helper'

describe 'Appointments API', type: :request do
  it 'see all appointments registered' do
    customer = create(:customer)
    appointment = create(:appointment, customer_id: customer.id)

    get api_customer_appointments_path(customer_id: customer.id)
    data = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(data[0]['date']).to eq I18n.localize appointment.date
    # expect(data[0]['start_time']).to eq appointment.start_time.strftime('%FT%T.%L')
    # expect(data[0]['start_time']).to eq appointment.start_time.iso8601
    # expect(data[0]['end_time']).to eq appointment.end_time
    expect(data[0]['status']).to eq appointment.status
    expect(data[0]['price']).to eq appointment.price
    expect(data[0]['customer_id']).to eq appointment.customer_id
  end

  it 'and see a message if no customer_id found' do
      get api_customer_appointments_path(customer_id: 1)

      data = JSON.parse(response.body)
      expect(data['message']).to eq 'Cliente não encontrado'
      expect(response.status).to eq 404
    end
end
