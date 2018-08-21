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
    render json: { message: 'Cliente não encontrado' }, status: 404
  end

  def create
    if Customer.create(customer_params)
      render json: { message: 'Cliente cadastrado com sucesso.' }, status: 201
    else
      render json: { message: 'Cliente não pode ser cadastrado.' }
    end
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      render json: { message: 'Cliente editado com sucesso.' }
    else
      render json: { message: 'Cliente não pode editado cadastrado.' }
    end
  end

  private

  def customer_params
    params.permit(:name, :email, :phone, :status)
  end
end
