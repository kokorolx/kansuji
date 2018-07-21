
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kansuji/version"

Gem::Specification.new do |spec|
  spec.name          = "kansuji"
  spec.version       = Kansuji::VERSION
  spec.authors       = ["Lê Hoàng Tâm"]
  spec.email         = ["tamlh@atmarkcafe.org"]

  spec.summary       = %q{Convert number to kanji and kanji to number in japanese}
  spec.description   = %q{Re-define Number and String to Convert number to kanji and kanji to number in japanese}
  spec.homepage      = "https://github.com/kokorolee/kansuji"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "'https://github.com/'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
