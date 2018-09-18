require 'rails_helper'
describe 'Prices API', type: :request do
  it 'see all customers registered' do
    customer = create(:customer)
    price = create(:price)

    get api_customer_prices_path(customer_id: customer.id)
    data = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(data[0]['price']).to eq price.price
    # expect(data[0]['readjust']).to eq I18n.localize price.readjust
    expect(data[0]['customer_id']).to eq price.customer_id
  end
end
