require 'rails_helper'
describe 'Prices API', type: :request do
  it 'delete a specific customer register' do
    customer = create(:customer)
    price = create(:price)

    delete api_customer_price_path(customer_id: customer.id, id: price.id)
    data = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(data['message']).to eq 'Preço deletado com sucesso.'
  end
end
