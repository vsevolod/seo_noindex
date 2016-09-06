lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seo_noindex/version'

Gem::Specification.new do |gem|
  gem.name          = "seo_noindex"
  gem.version       = SeoNoindex::VERSION
  gem.authors       = ["Vsevolod Avramov"]
  gem.email         = ["gsevka@gmail.com"]
  gem.description   = %q{Add noindex tag for disallowed path in robots.txt file}
  gem.summary       = "seo_noindex-#{SeoNoindex::VERSION}"
  gem.homepage      = "https://github.com/vsevolod/seo_noindex"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rack"
end
