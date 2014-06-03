# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Politi::Application.initialize!

Politi::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      address: "smtp.gmail.com",
      port: 587,
      domain: "politicly.org",
      authentication: "plain",
      user_name: "fevinci1",
      password: "imsMay33",
      enable_starttls_auto: true
  }
end
