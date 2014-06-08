# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Politi::Application.initialize!

Politi::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      address: "smtp.zoho.com",
      port: 465,
      domain: "politicly.org",
      authentication: "plain",
      user_name: "info@politicly.org",
      password: "imsMay33",
      enable_starttls_auto: true,
      ssl: true,
      tls: true
  }
end
