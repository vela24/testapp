# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_USERNAME'], # This is the string literal 'apikey', NOT the ID of your API key
  :password => ENV['SENDGRID_PASSWORD'], # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'sheltered-chamber-99174-f75c82d999a8.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
