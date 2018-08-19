class Api::CustomersController < ApplicationController
  def index
    customers = Customer.all
    json = customers.as_json
    render json: json
  end
end
