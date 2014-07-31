KajuInk::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  config.assets.debug = true

  # Indent html for pretty debugging and do not sort attributes (Ruby 1.9)
  Slim::Engine.set_default_options pretty: true, sort_attrs: false

  # Config mailer
  config.action_mailer.default_url_options = { host: "reverbee.com" }

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Deliver emails in dev environment
  config.action_mailer.perform_deliveries = true
end