require 'rails_helper'
describe 'Prices API', type: :request do
  it 'delete a specific appointment register' do
    customer = create(:customer)
    appointment = create(:appointment, customer_id: customer.id)

    delete api_appointment_path(id: appointment.id)
    data = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(data['message']).to eq 'Compromisso deletado com sucesso.'
  end
end
