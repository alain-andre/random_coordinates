lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "random_coordinates/version"

Gem::Specification.new do |spec|
  spec.name          = "random_coordinates"
  spec.version       = RandomCoordinates::VERSION
  spec.authors       = ["Alain ANDRÉ"]
  spec.email         = ["wordsbybird@alain-andre.fr"]

  spec.summary       = %q{Random coordinates generator.}
  spec.description   = %q{This gem allows to generate a random coordinate and to validate its position in a given area (e. g. avoid lake, sea, etc.). This is useful for obtaining locations by reverse geocoding.}
  spec.homepage      = "https://github.com/alain-andre/random_coordinates"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/alain-andre/random_coordinates"
  spec.metadata["changelog_uri"] = "https://github.com/alain-andre/random_coordinates/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
