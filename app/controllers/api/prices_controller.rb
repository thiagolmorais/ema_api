class Api::PricesController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    prices = customer.prices
    json = prices.as_json
    render json: json
  end

  def create
    if Price.create(price_params)
      render json: { message: 'Preço cadastrado com sucesso.' }, status: 201
    else
      render json: { message: 'Preço não pode ser cadastrado.' }
    end
  end

  private

  def price_params
    params.permit(:name, :email, :phone, :customer_id)
  end
end
