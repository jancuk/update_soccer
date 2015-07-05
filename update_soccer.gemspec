# coding: utf-8
lib = File.expand_path('../lib',__FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'update_soccer/version'

Gem::Specification.new do |spec|
  spec.name           = "update_soccer"
  spec.version        = UpdateSoccer::VERSION
  spec.authors        = ["jancuk"]
  spec.email          = ["cak.azharr@gmail.com"]
  spec.summary        = %q{Livesoccer}
  spec.description    = %q{info about Live Soccer}
  spec.homepage       = "http://github.com/jancuk/update_soccer"
  spec.license        = "MIT"

  spec.files          = `git ls-files -z`.split("\x0")
  spec.executables    = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files     = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths  = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "railties", "~> 4.0"
end
