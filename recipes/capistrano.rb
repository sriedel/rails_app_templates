# 
# Capistrano
#
say "Capifying"
capify!
git :add => "."
git :commit => "-m 'Capistrano deployment files added'"

