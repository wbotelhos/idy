# frozen_string_literal: true

require_relative 'lib/idy/version'

Gem::Specification.new do |spec|
  spec.author           = 'Washington Botelho'
  spec.description      = 'An ID obfuscator for ActiveRecord.'
  spec.email            = 'wbotelhos@gmail.com'
  spec.extra_rdoc_files = Dir['CHANGELOG.md', 'LICENSE', 'README.md']
  spec.files            = Dir['lib/**/*']
  spec.homepage         = 'https://github.com/wbotelhos/idy'
  spec.license          = 'MIT'
  spec.name             = 'idy'
  spec.summary          = 'An ID obfuscator for ActiveRecord.'
  spec.version          = Idy::VERSION

  spec.add_dependency 'activerecord'
  spec.add_dependency 'hashids'

  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'sqlite3'
end
