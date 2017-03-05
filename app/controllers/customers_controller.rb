class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]

  def index
    @customers = Customer.all
    json_response(@customers)
  end

  def show
    json_response(@customer)
  end

  private

  def customer_params
    params.permit(:email, :password, :name, :phone, :verified_email, :braintree_customer_id)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
