class Api::CustomersController < ApplicationController
  def index
    customers = Customer.all
    json = customers.as_json
    render json: json
  end

  def show
    customer = Customer.find(params[:id])
    json = customer.as_json
    render json: json
  rescue ActiveRecord::RecordNotFound
    render json: 'Nenhum cliente encontrado', status: 404
  end
end
