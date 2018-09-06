require 'rails_helper'
describe 'Appointments API', type: :request do
  it 'see all appointments registered' do
    customer = create(:customer)
    appointment = create(:appointment, customer_id: customer.id)

    get api_appointments_path
    data = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(data[0]['date']).to eq I18n.localize appointment.date
    # expect(data[0]['start_time']).to eq appointment.start_time
    # expect(data[0]['end_time']).to eq appointment.end_time
    expect(data[0]['status']).to eq appointment.status
    expect(data[0]['price']).to eq appointment.price
    expect(data[0]['customer_id']).to eq appointment.customer_id
  end
end
