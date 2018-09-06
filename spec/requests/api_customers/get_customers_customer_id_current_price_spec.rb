require 'rails_helper'
describe 'Current price API', type: :request do
  it 'see a current price of a specific customer' do
    customer = create(:customer)
    current_price = create(:price, readjust: '2018-09-05')
    price = create(:price, readjust: '2018-09-01')

    get api_customer_current_price_path(customer_id: customer)
    data = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(data[0]['price']).to eq current_price.price
    expect(data[0]['readjust']).to eq I18n.localize current_price.readjust
  end

  it 'and see a message if no customer_id found' do
    customer = create(:customer)

    get api_customer_current_price_path(customer_id: customer)

    data = JSON.parse(response.body)
    expect(data['message']).to eq 'Cliente não tem preço cadastrado.'
  end
end
