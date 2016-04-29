# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'social_shares/version'

Gem::Specification.new do |spec|
  spec.name          = 'social_shares'
  spec.version       = SocialShares::VERSION
  spec.authors       = ['Timur Kozmenko']
  spec.email         = ['timraell@gmail.com']
  spec.summary       = %q{Check how many times url was shared in social networks.}
  spec.description   = %q{Check how many times url was shared in social networks, e.g. share counts.}
  spec.homepage      = 'https://github.com/Timrael/social_shares'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client'
  spec.add_dependency 'json', '>= 1.8.3'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
