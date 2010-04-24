#
# Cucumber
#
say "Installing Cucumber"
gem "capybara",                  :group => "test"
gem "database_cleaner",          :group => "test"
gem "cucumber",         "0.6.4", :group => "test"
gem "cucumber-rails",   "0.3.0", :group => "test"
run "bundle install"
generate "cucumber:skeleton", "--capybara", "--rspec", "--spork"
git :add => "."
git :commit => "-m 'Installed Cucumber'"
