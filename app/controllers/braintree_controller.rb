class BraintreeController < ApplicationController

  def show
    json_response({token:Braintree::ClientToken.generate})
  end

  def create
    nonce_from_the_client = braintree_params[:payment_method_nonce]
    result = Braintree::Transaction.sale(
      :amount => braintree_params[:amount],
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
    )
  end

  def braintree_params
    params.permit(:amount,:payment_method_nonce)
  end

end
