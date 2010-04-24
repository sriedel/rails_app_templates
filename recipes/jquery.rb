# 
# JQuery
#
say "Replacing Prototype with JQuery"
PROTOTYPE_FILES = %W( controls.js dragdrop.js effects.js prototype.js rails.js )
JQUERY_FILES = %W( jquery-1.4.2.min.js jquery-1.4.2.js )

PROTOTYPE_FILES.each do |prototype_file|
  remove_file File.join( 'public', 'javascripts', prototype_file )
end

JQUERY_FILES.each do |jquery_file|
  get "http://code.jquery.com/#{jquery_file}", 
      "public/javascripts/#{jquery_file}"
end
FileUtils::ln_s 'jquery-1.4.2.js', File.join( %W(public javascripts jquery.js) )

UJS_COMMIT = "ac78a119772f2d1bb495ff2b9f84d33a9a2c3f80"
get "http://github.com/rails/jquery-ujs/raw/#{UJS_COMMIT}/src/rails.js", 
    File.join( %W(public javascripts rails.js) )

gsub_file File.join( %W(app views layouts application.html.erb) ), 
          %r{javascript_include_tag :defaults},
          'javascript_include_tag "jquery.js"'
git :add => "."
git :commit => "-m 'Replaced Prototype with JQuery'"
