# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-wgdd"
  spec.version       = "0.0.1"
  spec.authors       = ["Daniel Leidert"]
  spec.email         = ["daniel.leidert@wgdd.de"]

  spec.summary       = "Private jekyll theme for a private blog"
  spec.homepage      = "https://github.com/dleidert/jekyll-wgdd"
  spec.license       = "Unlicense"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_runtime_dependency "jekyll", "~> 3.8"

  spec.add_development_dependency "bundler", "~> 1.16"
end
