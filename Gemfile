source "https://rubygems.org"

gem "rails", "~> 8.0.2"

gem "aws-sdk-s3", require: false
gem "bootsnap", require: false
gem "dotenv"
gem "image_processing", "~> 1.14.0"
gem "importmap-rails"
gem "pg", "~> 1.5.9"
gem "propshaft"
gem "pry"
gem "puma", ">= 6.6.0"
# gem "solid_cache"
# gem "solid_queue"
# gem "solid_cable"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "thruster", require: false
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[windows jruby]

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.20"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "brakeman", require: false
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "rubocop"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end
