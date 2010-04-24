#
# Devise
#
say "Install devise"
gem "devise", "1.1.rc1"
run "bundle install"
generate "devise_install"
gsub_file File.join( %W(config routes.rb) ), %r{# root :to }, "root :to "
environment "  config.action_mailer.default_url_options = { :host => 'localhost:3000' }", :env => :development
inject_into_file File.join( %W( app views layouts application.html.erb ) ),
                 %{  <p class="notice"><%= notice %></p>
                     <p class="alert"><%= alert %></p>
                 },
                 :after => %r{<body>\n}
git :add => "."
git :commit => "-m 'Installed Devise'"
