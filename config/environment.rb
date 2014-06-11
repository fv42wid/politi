# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Politi::Application.initialize!

Politi::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      address: "smtp.sendgrid.net",
      port: '587',
      domain: "heroku.com",
      authentication: "plain",
      user_name: ENV['SENDGRID_USERNAME'],
      password: ENV['SENDGRID_PASSWORD'],
      enable_starttls_auto: true
  }
end
