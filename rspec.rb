#
# Rspec
#
say "Replacing Test::Unit with Rspec"
remove_file "test"
gem "rspec-rails", ">= 2.0.0.beta.7", :group => "test"
gsub_file File.join( %W(config application.rb) ), 
          %r{^\s*# config.generators do.*?end}m do |match|
  %{
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :rspec
    end
  }
end
run "bundle install"
generate "rspec:install"
git :add => "."
git :commit => "-m 'Replaced Test::Unit with Rspec'"

