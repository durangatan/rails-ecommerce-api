require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
# require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Api
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    # ActiveRecord::Base.logger = Logger.new(STDOUT)
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = 'd2fn4w3ht4mvndxn'
    Braintree::Configuration.public_key = 'jts529mz52rvq8zm'
    Braintree::Configuration.private_key = '4de51e607540c8b72ab56cfac6dc0330'
    config.api_only = true
  end
end
