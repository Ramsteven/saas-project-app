Rails.application.configure do
  config.action_mailer.default_url_options = {
    host: 'secure.simple-milia-app.com', protocol: 'https'
  }

  ActionMailer::Base.delivery_method = :smtp

  ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: '587',
    authentication: :plain,
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    domain: 'heroku.com'
  }

  config.cache_classes = true

  config.eager_load = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = {
    host: 'saas-project-davi.herokuapp.com', protocol: 'https'
  }

  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  config.require_master_key = true

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.js_compressor = :uglifier

  config.assets.compile = false

  config.active_storage.service = :amazon

  config.log_level = :debug

  config.log_tags = %i[request_id]

  config.action_mailer.perform_caching = false

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
end
