source 'https://rubygems.org'
gem 'rails', '3.2.8'

group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'

# DYANMIC ANALYSIS
  gem 'simplecov', :require => false

# DYNAMIC ANALYSIS: SECURITY
  gem 'tarantula', :require => 'tarantula-rails3'
end

group :development, :test do
  gem 'mysql'
  gem 'database_cleaner'
  gem "capybara"
  gem 'launchy'
  gem 'rspec'
  gem "rspec-rails", "~> 2.0"
  gem 'factory_girl'
  gem "factory_girl_rails", ">= 3.5.0"
  gem 'selenium'
  gem 'simplecov', :require => false
  gem 'autotest'
  gem 'debugger'
  #gem 'html2haml'

# STATIC ANALYSIS
  gem 'cane' # include 'flog' 
  gem 'flay' # dryness
  gem 'reek' # more bad style
  gem 'rails_best_practices' # LOTS of messages
  gem 'excellent'

# STATIC ANALYSIS: SECURITY
  gem "brakeman"

  gem "letter_opener"
  gem "email_spec", ">= 1.2.1" #, :group => :test, :development
end

group :production do
  gem 'pg'
end

group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "haml", ">= 3.1.6"
gem "haml-rails", ">= 0.3.4", :group => :development
gem "jquery-datatables-rails", ">= 1.10.0"
gem "bootstrap-sass", ">= 2.0.3"
gem "simple_form"
gem "heroku"
gem "hominid" # related to mailchimp email service
gem "google_visualr", ">= 2.1.2" # Google Chart Tools

gem "devise", ">= 2.1.2"
gem "devise_invitable", ">= 1.0.2"
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.1.0"

gem "surveyor", :git => "git://github.com/NUBIC/surveyor.git"
gem "pdfkit"
gem "wkhtmltopdf-binary"

