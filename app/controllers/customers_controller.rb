class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]
  before_action :authenticate_customer!, only:[:index, :destroy, :show, :update]
  before_action :admin_only!, only: [:index, :destroy]
  before_action :self_only!, only: [:show, :update]

  def index
    @customers = Customer.all
    json_response(@customers)
  end

  def show
    render json: CustomerSerializer.new(@param_customer).to_json
  end

  def create
    @param_customer = Customer.create!(customer_params)
    json_response(@param_customer, :created)
  end

  def update
    @param_customer.update(customer_params)
    head :no_content
  end


  def destroy
    @param_customer.destroy
    head :no_content
  end

  private

  def customer_params
    params.permit(:email, :password, :name, :phone, :verified_email, :braintree_customer_id)
  end

  def set_customer
    @param_customer = Customer.find(params[:id])
  end

  def self_only!
    return json_response({}, :unauthorized) unless (@customer.id == @param_customer.id) || @customer.admin
  end
end
