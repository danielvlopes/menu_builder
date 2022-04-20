$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "menu_builder/version"

Gem::Specification.new do |s|
  s.name        = "menu_builder"
  s.version     = MenuBuilder::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Daniel Lopes"]
  s.email       = ["danielvlopes@gmail.com"]
  s.summary     = "minimalist solution for menus and tabs in Rails"
  s.description = "helper and controller macros to define current menu item and also create the menu in view."

  s.rubyforge_project = "menu_builder"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "actionpack", ">6.0"
  s.add_dependency "activemodel", ">6.0"
  s.add_development_dependency "rails-controller-testing"
  s.add_development_dependency "rake"
end
