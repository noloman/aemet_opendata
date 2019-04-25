lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "aemet_opendata/version"

Gem::Specification.new do |spec|
  spec.name          = "aemet_opendata"
  spec.version       = AemetOpendata::VERSION
  spec.authors       = ["Manuel Lorenzo Parejo"]
  spec.email         = ["manulorenzop@gmail.com"]
  spec.summary       = %q{ Extracts weather information from https://opendata.aemet.es }
  spec.homepage      = "https://www.github.com/noloman/aemet_opendata"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'faraday', '>= 0.15.3'
  spec.add_development_dependency 'faraday-encoding', '>= 0.0.5'
  spec.add_development_dependency 'json', '>= 1.5.5'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'ruby', '=> 2.6.0'
  spec.add_development_dependency 'typhoeus', '>= 1.3.0'
  spec.add_development_dependency 'vcr', '>= 4.0.0'
end
