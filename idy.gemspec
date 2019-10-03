# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'idy/version'

Gem::Specification.new do |spec|
  spec.author      = 'Washington Botelho'
  spec.description = 'An ID obfuscator for ActiveRecord.'
  spec.email       = 'wbotelhos@gmail.com'
  spec.files       = Dir['lib/**/*'] + %w[CHANGELOG.md LICENSE README.md]
  spec.homepage    = 'https://github.com/wbotelhos/idy'
  spec.license     = 'MIT'
  spec.name        = 'idy'
  spec.platform    = Gem::Platform::RUBY
  spec.summary     = 'An ID obfuscator for ActiveRecord.'
  spec.test_files  = Dir['spec/**/*']
  spec.version     = Idy::VERSION

  spec.add_dependency 'hashids',      '~> 1.0'
  spec.add_dependency 'activerecord', '>= 4.2', '< 6'

  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'sqlite3'
end
