# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
# Speed up tests by lowering bcrypt's cost function
ActiveModel::SecurePassword.min_cost = true

SampleApp::Application.initialize!
