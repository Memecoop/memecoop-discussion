source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Use OmniAuth for Facebook and other external authentication schemes
gem 'omniauth'
gem 'omniauth-facebook'

# Use Authlogic for user authentication.
gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'

# Use declarative_authorization for role assignments.
gem "declarative_authorization", :git => "git://github.com/stffn/declarative_authorization.git"

# Use Bootstrap for layout & CSS magic
gem 'bootstrap-sass'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :production do
  gem 'pg'
end

group :development do
  gem 'rspec-rails', '2.6.1'
  gem 'sqlite3'
end

group :test do
  # Pretty printed test output
  gem 'rspec-rails', '2.6.1'
  gem 'webrat', '0.7.1'
  gem 'turn', :require => false
  gem 'factory_girl_rails', '1.0'
end
