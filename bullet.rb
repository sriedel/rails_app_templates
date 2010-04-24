#
# Bullet
#
say "Install bullet"
gem "bullet", "=~ 1.7.6", :group => "development"
append_file File.join( %W(config environments development.rb) ), <<-EOF
config.after_initialize do
  Bullet.enable = true 
  Bullet.alert = true
  Bullet.bullet_logger = true  
  Bullet.console = true
  Bullet.growl = false
  Bullet.rails_logger = true
  Bullet.disable_browser_cache = true
end

begin
  require 'ruby-growl'
  Bullet.growl = true
rescue MissingSourceFile
end
 
EOF

git :add => "."
git :commit => "-m 'Installed Bullet'"
