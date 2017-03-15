class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]

  def index
    @customers = Customer.all
    json_response(@customers)
  end

  def show
    render json: CustomerSerializer.new(@customer).to_json
  end

  def create
    @customer = Customer.create!(customer_params)
    json_response(@customer, :created)
  end

  def update
    @customer.update(customer_params)
    head :no_content
  end


  def destroy
    @customer.destroy
    head :no_content
  end

  private

  def customer_params
    params.permit(:email, :password, :name, :phone, :verified_email, :braintree_customer_id)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
