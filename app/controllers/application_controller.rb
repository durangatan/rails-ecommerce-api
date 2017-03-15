class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def authenticate_customer!
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

    customer_email = options.blank?? nil : options[:email]
    customer = customer_email && Customer.find_by(email: customer_email)
    customer && ActiveSupport::SecurityUtils.secure_compare(customer.auth_token, token)
  end
end
