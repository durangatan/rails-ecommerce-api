class SessionsController < ApplicationController
  before_action :set_customer

  def create
    if @param_customer && @param_customer.authenticate(create_params[:password])
      return render json: SessionsSerializer.new(@param_customer).to_json
    else
      return json_response({ message: 'Unable to authenticate' }, :unprocessable_entity)
    end
  end

  private
  def create_params
    params.permit(:email, :password)
  end
  def set_customer
    @param_customer = Customer.find_by_email(create_params[:email])
  end

end
