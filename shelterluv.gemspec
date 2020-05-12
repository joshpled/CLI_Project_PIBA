require_relative 'lib/shelterluv/version'

Gem::Specification.new do |spec|
  spec.name          = "shelterluv"
  spec.version       = Shelterluv::VERSION
  spec.authors       = ["joshpled"]
  spec.email         = ["joshuapleduc@gmail.com"]

  spec.summary       = %q{"Takes SheltLuv API for the PIBA Foundation and displays information."}
  spec.description   = %q{"ShelterLuv is a website that provides shelter's with a wonderful interface to intake dogs and process fosters and adoptions. This gem will allow you to use ShelterLuv API to grab information from the database and allow you to push information to a website or other."}
  spec.homepage      = "https://github.com/joshpled/CLI_Project_PIBA"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/joshpled/CLI_Project_PIBA"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
