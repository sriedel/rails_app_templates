require 'active_support/core_ext/array/wrap' # Otherwise #environment cries

RECIPE_PATH = File.dirname( rails_template )
RECIPES_TO_APPLY = %w{ rspec cucumber jquery devise bullet capistrano }


#
# Initialize Git Repository
# 
git :init
git :add => "."
git :commit => "-m 'initial bare rails project tree'"


RECIPES_TO_APPLY.each do |recipe|
  recipe_file = File.join( "recipes", "#{recipe}.rb" )
  apply File.join( RECIPE_PATH, recipe_file )
end

# 
# Git GC
#
say "Garbage collecting git repository"
git :gc

#
# Last instructions
#
say <<-EOF

Things left for you to do:
  * rails generate devise <Model for Login Data>
  * rake db:migrate
  * Add 'devise_for :model' to config/routes.rb
  * Code stuff
EOF
