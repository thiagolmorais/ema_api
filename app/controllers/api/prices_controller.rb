class Api::PricesController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    prices = customer.prices.order(:readjust)
    json = prices.as_json
    render json: json
  end

  def create
    price = Price.new(price_params)
    if price.save
      render json: { message: 'Preço cadastrado com sucesso.' }, status: 201
    else
      render json: { message: 'Preço não pode ser cadastrado.' }
    end
  end

  private

  def price_params
    params.permit(:price, :readjust, :customer_id)
  end
end
