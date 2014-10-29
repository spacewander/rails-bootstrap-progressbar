$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap_progressbar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'bootstrap_progressbar'
  s.version     = BootstrapProgressbar::VERSION
  s.authors     = ["spacewander"]
  s.email       = ["spacewanderlzx@gmail.com"]
  s.homepage    = 'https://github.com/spacewander/rails-bootstrap-progressbar'
  s.summary     = 'build Bootstrap 3 progress bar quickly in rails'
  s.description = 'bootstrap_progressbar makes it super easy to create beautiful-looking progress bar in rails using Bootstrap 3'
  s.files       = Dir["{app,config,db,lib}/**/*"] + ["README.md", "Rakefile"]
  s.test_files  = Dir["test/*"]
  s.license     = 'MIT'

  s.add_development_dependency("rails", ">= 4.0.0")
  s.add_development_dependency("sqlite3")
end
