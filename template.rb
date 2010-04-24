require 'active_support/core_ext/array/wrap' # Otherwise #environment cries

RECIPE_FILE_PATH = File.join( File.dirname( rails_template ), "recipes" )
RECIPE_HTTP_PATH = "http://github.com/sriedel/rails_app_templates/raw/master/recipes"

RECIPES_TO_APPLY = %w{ rspec cucumber jquery devise bullet capistrano }

# Use recipes on the local filesystem
recipe_path = RECIPE_FILE_PATH
# If you want to get the recipes via HTTP, use this instead of the above:
# recipe_path = RECIPE_HTTP_PATH 


#
# Initialize Git Repository
# 
git :init
git :add => "."
git :commit => "-m 'initial bare rails project tree'"


RECIPES_TO_APPLY.each do |recipe|
  apply File.join( recipe_path, "#{recipe}.rb" )
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
