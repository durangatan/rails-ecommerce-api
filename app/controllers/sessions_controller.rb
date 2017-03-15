class SessionsController < ApplicationController
  before_action :set_customer

  def create
    puts @customer
    if @customer && @customer.authenticate(create_params[:password])
      return render json: SessionsSerializer.new(@customer).to_json
    else
      return json_response({message:"Unable to authenticate"}, :unprocessable_entity)
    end
  end

  private
  def create_params
    params.permit(:email, :password)
  end
  def set_customer
    @customer = Customer.find_by_email(params[:email])
  end
end
